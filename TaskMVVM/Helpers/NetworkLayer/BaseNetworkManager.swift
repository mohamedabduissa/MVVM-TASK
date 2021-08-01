import Alamofire
import UIKit

// MARK: - ...  Base Network manager // downloader // paginator // alertable
class BaseNetworkManager {
    private let url = NetworkConfigration.URL
    private var header: HTTPHeaders {
        get {
            return .init(headers)
        }
    }
    var paramaters: [String: Any] = [:]
    var headers: [HTTPHeader] = []
    var isHttpRequestRun: Bool = false
    init() {
        setupObject()
    }
}
// MARK: - ...  Functions setup
extension BaseNetworkManager {
    // MARK: - ...  refresh for new request
    func refresh() {
        setupObject()
    }
    // MARK: - ...  setup request object
    func setupObject() {
        headers.removeAll()
        //hide()
        setupAuth()
        headers.append(.init(name: "version", value: NetworkConfigration.VERSION))
    }
    // MARK: - ...  setup auth header
    func setupAuth() {
        headers.append(.init(name: "Authorization", value: ""))
    }
    // MARK: - ...  reset the object
    func resetObject() {
        self.paramaters = [:]
        setupObject()
    }
    // MARK: - ...  initailize the FULL URL
    func initURL(method: String, type: HTTPMethod) -> String {
        var url = ""
        url = self.url+method
        return url
    }
    func checkReachability() -> Bool {
        if !Reachability.isConnectedToNetwork() {
            Coordinator.instance.networkFail()
            return false
        } else {
            return true
        }
    }
}
// MARK: - ...  Handle response for request
extension BaseNetworkManager {
    func response<M: Codable>(response: DataResponse<Any, AFError>, _ model: BaseModel<M>.Type ,completionHandler: @escaping (NetworkResponse<M>) -> Void) {
        print(response.value ?? "")
        self.isHttpRequestRun = false
        switch response.result {
            case .success:
                switch response.response?.statusCode {
                    case 200?:
                        do {
                            guard let data = response.data else { return }
                            let model = try JSONDecoder().decode(M.self, from: data)
                            completionHandler(.success(model))
                        } catch DecodingError.typeMismatch(let type , let context) {
                            let error = "Type \(type) mismatch: \(context.debugDescription)/n/n codingPath: \(context.codingPath)"
                            print(error)
                            return completionHandler(.failure(NetworkError.init(message: error)))
                        } catch DecodingError.keyNotFound(let key, let context) {
                            let error = "Key \(key) mismatch: \(context.debugDescription)/n/n codingPath: \(context.codingPath)"
                            print(error)
                            return completionHandler(.failure(NetworkError.init(message: error)))
                        } catch DecodingError.valueNotFound(let value, let context) {
                            let error = "Value \(value) mismatch: \(context.debugDescription)/n/n codingPath: \(context.codingPath)"
                            print(error)
                            return completionHandler(.failure(NetworkError.init(message: error)))
                        } catch DecodingError.dataCorrupted(let context) {
                            let error = "\(context.debugDescription)/n/n codingPath: \(context.codingPath)"
                            return completionHandler(.failure(NetworkError.init(message: error)))
                        } catch {
                            return completionHandler(.failure(error))
                        }
                    case 201?:
                        do {
                            let model = try JSONDecoder().decode(BaseModel<M>.self, from: response.data ?? Data())
                            completionHandler(.success(model.data))
                        } catch { return completionHandler(.failure(error)) }
                    case 400?:
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        let error: NetworkError = .init(message: "")
                        completionHandler(.failure(error))
                    case 401?:
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        Coordinator.instance.restart()
                    case 404?:
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        let error: NetworkError = .init(message: "")
                        completionHandler(.failure(error))
                    case 422?:
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        let error: NetworkError = .init(message: "")
                        completionHandler(.failure(error))
                    case 426?:
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        let error: NetworkError = .init(message: "")
                        completionHandler(.failure(error))
                    case 503?:
                        break
                    case .none:
                        break
                    case .some(let error):
                        let scene = UIApplication.topViewController() as? PresentingViewProtocol
                        scene?.stopLoading()
                        let error: NetworkError = .init(message: String(error))
                        completionHandler(.failure(error))
                }
            case .failure:
                let scene = UIApplication.topViewController() as? PresentingViewProtocol
                scene?.stopLoading()
        }
    }
}
// MARK: - ...  Connections
extension BaseNetworkManager {
    // MARK: - ...  Advanced request for raw with json object
    @discardableResult
    func connectionRaw<M: Codable>(_ method: String, type: HTTPMethod, json: Data? = nil, _ model: BaseModel<M>.Type,
                                   completionHandler: @escaping (NetworkResponse<M>) -> Void) -> DataRequest? {
        if !checkReachability() {
            return nil
        }
        self.isHttpRequestRun = true
        let url = initURL(method: method, type: type)
        print(url)
        let paramters = self.paramaters
        self.resetObject()
        let manager = AF
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        var request = URLRequest(url: URL(string: safeUrl(url: url))!)
        if json != nil {
            let paramString = String(data: json ?? Data(), encoding: String.Encoding.utf8)
            request.httpBody = paramString?.data(using: .utf8)
        } else {
            do {
                let data = try JSONSerialization.data(withJSONObject: paramters, options: [])
                let paramString = String(data: data, encoding: String.Encoding.utf8)
                request.httpBody = paramString?.data(using: .utf8)
            } catch let error {
                print("Error : \(error.localizedDescription)")
            }
        }
        headers.append(.init(name: "Content-Type", value: "application/json"))
        request.httpMethod = type.rawValue
        request.allHTTPHeaderFields = header.dictionary
        request.cachePolicy = .reloadIgnoringCacheData // <<== Cache disabled
        let alamofire = AF.request(request)
            .responseJSON { response in
                self.response(response: response, model, completionHandler: completionHandler)
            }
        return alamofire
    }
    
}

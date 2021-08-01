import CoreData
import Alamofire
// MARK: - ...  NetworkManager
class NetworkManager: BaseNetworkManager {
    struct Static {
        static var instance: NetworkManager?
    }
    class var instance: NetworkManager {
        if Static.instance == nil {
            Static.instance = NetworkManager()
        }
        return Static.instance!
    }
}

// MARK: - ...  functions
extension NetworkManager {
    
    @discardableResult
    func requestRaw<M: Codable>(_ method: String, json: Data? = nil, type: HTTPMethod, _ model: M.Type, completionHandler: @escaping (NetworkResponse<M>) -> Void) -> DataRequest? {
        super.refresh()
        let request = super.connectionRaw(method, type: type, json: json, BaseModel<M>.self, completionHandler: completionHandler)
        return request
    }
}

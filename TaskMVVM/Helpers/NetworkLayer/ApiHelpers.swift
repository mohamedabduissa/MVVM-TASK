import CoreData
import UIKit

// MARK: - ...  Functions help the network manager
extension BaseNetworkManager {
    func safeUrl(url: String) -> String {
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        return safeURL
    }
}

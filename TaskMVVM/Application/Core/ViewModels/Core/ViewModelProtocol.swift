//
//  ViewModelProtocol.swift
//  SupportI
//
//  Created by mohamed abdo on 5/31/18.
//  Copyright © 2018 MohamedAbdu. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - ...  ViewModelProtocol Protocol
// All ViewModels must implement this protocol
protocol ViewModelProtocol {
    // All requests in view model
    var requests: [DataRequest?] { get set }
    func removeTasks()

}
// MARK: - ...  Implement pagination functions
extension ViewModelProtocol {
    func removeTasks() {
        requests.forEach { (request) in
            request?.task?.cancel()
        }
    }
}

//
//  CoreViewModel.swift
//  SupportI
//
//  Created by mohamed abdo on 5/31/18.
//  Copyright © 2018 MohamedAbdu. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - ...  Base ViewModel
class BaseViewModel: NSObject, ViewModelProtocol {
    var requests: [DataRequest?] = []
    
    // MARK: - ...  empty the refrence 
    deinit {
        removeTasks()
    }
}

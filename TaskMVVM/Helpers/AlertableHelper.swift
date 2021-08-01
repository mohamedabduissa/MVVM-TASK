//
//  Alertable.swift
//  SupportI
//
//  Created by mohamed abdo on 7/30/19.
//  Copyright © 2019 MohamedAbdu. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  Alertable protocol for alert messages
protocol Alertable: AnyObject {
    func makeAlert(_ message: String, noCancel: Bool?, closure: @escaping () -> Void )
}

extension Alertable where Self: UIViewController {
    func makeAlert(_ message: String, noCancel: Bool? = nil, closure: @escaping () -> Void ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let acceptAction = UIAlertAction(title: "Ok", style: .default) { (_) -> Void in
            closure()
        }
        alert.addAction(acceptAction)
        if noCancel == nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) -> Void in
            }
            alert.addAction(cancelAction)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

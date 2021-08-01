//
//  EndPoint.swift
//  SupportI
//
//  Created by Mohamed Abdu on 3/20/20.
//  Copyright © 2020 MohamedAbdu. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ...  Network layer configration
struct NetworkConfigration {
    static let URL = "https://dhcr.gov.ae/MobileWebAPI/api/Common/ServiceCatalogue/GetDepartmentServices"
    static let VERSION = "v1"
    
    // MARK: - ...  The Endpoints
    public enum EndPoint: String {
        case nutrition
    }
}

extension NetworkConfigration.EndPoint {
    static func endPoint(point: NetworkConfigration.EndPoint, paramters: [Any]) -> String {
        return point.rawValue
    }
}


//
//  IngerduntsCoordinator.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

// MARK: - ...  Coordinator
class FacilityDetailsCoordinator: Coordinator {
    typealias PresentingView = FacilityDetailsVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension FacilityDetailsCoordinator: FacilityDetailsCoordinatorContract {
    
}

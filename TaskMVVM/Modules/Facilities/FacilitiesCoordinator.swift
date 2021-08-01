//
//  IngerduntsCoordinator.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

// MARK: - ...  Coordinator
class FacilitiesCoordinator: Coordinator {
    typealias PresentingView = FacilitiesVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension FacilitiesCoordinator: FacilitiesCoordinatorContract {
    /**
     navigate function to details screen
     
     - parameter void: void.
     - returns: void
     - warning: void
     
     */
    func navigateToDetails() {
        guard let scene = R.storyboard.facilityDetailsStoryboard.facilityDetailsVC() else { return }
        scene.viewModel = view?.viewModel
        view?.push(scene)
    }
}

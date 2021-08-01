//
//  IngerduntsVC.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  ViewController - Vars
class FacilityDetailsVC: BaseController {
    // MARK:  Outlets
    @IBOutlet weak var facilityImage: UIImageView!
    @IBOutlet weak var facilityDescLbl: UILabel!
    @IBOutlet weak var preRequestLbl: UILabel!
    @IBOutlet weak var documentLbl: UILabel!
    @IBOutlet weak var feesLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var serviceLbl: UILabel!
    @IBOutlet weak var policyLbl: UILabel!
    
    // MARK:  Private VARS
    private var coordinator: FacilityDetailsCoordinator?
    private var model: FacilityModel.Datum? {
        guard let index = viewModel?.selectedIndex else { return nil }
        return viewModel?.dataSource()[safe: index]
    }
    // MARK:  VARS
    var viewModel: FacilitiesViewModel?
    
}

// MARK: - ...  LifeCycle
extension FacilityDetailsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = .init()
        coordinator?.view = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        bind()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
// MARK: - ...  Functions
extension FacilityDetailsVC {
    /**
     Setup view
     
     - parameter void: void.
     - returns: void
     - warning: void
     
     */
    func setup() {
        title = model?.title
        facilityImage.download(url: model?.mobileImageSrc)
        facilityDescLbl.attributedText = model?.datumDescription?.htmlToAttributedString
        preRequestLbl.attributedText = model?.prerequisites?.htmlToAttributedString
        documentLbl.attributedText = model?.requiredDocuments?.htmlToAttributedString
        feesLbl.attributedText = model?.fees?.htmlToAttributedString
        timeLbl.attributedText = model?.timeFrame?.htmlToAttributedString
        serviceLbl.attributedText = model?.serviceChannels?.htmlToAttributedString
        policyLbl.attributedText = model?.policiesAndProcedures?.htmlToAttributedString
    }
    
    
}

// MARK: - ...  actions
extension FacilityDetailsVC {
   
}

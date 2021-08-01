//
//  IngerduntCell.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import UIKit

class FacilityCell: UITableViewCell {
    // MARK:  Outlets
    @IBOutlet weak var facilityImage: UIImageView!
    @IBOutlet weak var facilityLbl: UILabel!
    @IBOutlet weak var facilityDescLbl: UILabel!
    
    // MARK:  VARS
    var model: FacilityModel.Datum? {
        didSet {
            setup()
        }
    }
 
}

// MARK:  Setup cell
extension FacilityCell {
    /**
     Setup cell
     
     - parameter Void : Void.
     - returns: Void
     - warning: please provide the model before calling it
     
     */
    func setup() {
        facilityImage.download(url: model?.mobileImageSrc)
        facilityLbl.text = model?.titleEN
        facilityDescLbl.text = model?.briefTrimmedEN
    }
   
}

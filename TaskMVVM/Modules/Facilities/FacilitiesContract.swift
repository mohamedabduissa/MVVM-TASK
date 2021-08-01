//
//  IngerduntsContract.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation


// MARK: - ...  Coordinator Contract
protocol FacilitiesViewModelContract: ViewModelProtocol {
    /**
     page for paginate
     
     - parameter Void
     - returns: Void
     - warning: Void
     
     */
    var page: Int? { get set }
    
    /**
     selectedIndex for details
     
     - parameter Void
     - returns: Void
     - warning: Void
     
     */
    var selectedIndex: Int? { get set }
    
    /**
     Plus pages in source
     
     - parameter array: [Array<Any>].
     - returns: void
     - warning: void
     
     */
    func paginate(_ array: Array<Any>)
    
    /**
     check the server has a next page or not
     
     - parameter void
     - returns: BOOL
     - warning: void
     
     */
    func nextPage() -> Bool
    
    /**
     Count for data source all facilities
     
     - parameter void: void.
     - returns: Integer
     - warning: void
     
     */
    func count() -> Int
    /**
     dataSource  source all facilities
     
     - parameter void: void.
     - returns: facility model
     - warning: void
     
     */
    func dataSource() -> [FacilityModel.Datum]
    
    /**
     fetch all facilities from API
     
     - parameter Void
     - returns: Void
     - warning: Void
     
     */
    func fetch()
    
    
}


// MARK: - ...  Coordinator Contract
protocol FacilitiesCoordinatorContract: CoordinatorProtocol {
    /**
     navigate function to details screen
     
     - parameter void: void.
     - returns: void
     - warning: void
     
     */
    func navigateToDetails()
}


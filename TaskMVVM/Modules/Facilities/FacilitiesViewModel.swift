//
//  IngerduntsViewModel.swift
//  TaskMVVM
//
//  Created by Mabdu on 28/06/2021.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

// MARK: - ...  ViewModel
class FacilitiesViewModel: BaseViewModel {
    private var facilities: [FacilityModel.Datum] = []
    private var paginateNext: Bool = true
    
    internal var facilitiesSuccess: DynamicType = DynamicType<Bool>()
    internal var facilitiesError: DynamicType = DynamicType<String>()
    internal var page: Int? = 1
    internal var selectedIndex: Int?
    
    override init() {
        super.init()
    }
}
extension FacilitiesViewModel: FacilitiesViewModelContract {
    /**
     Plus Facility in source
     
     - parameter array: [Array<Any>].
     - returns: void
     - warning: void
     
     */
    func paginate(_ array: Array<Any>) {
        if array.count >= 10 {
            self.page = (self.page ?? 1) + 1
        } else {
            paginateNext = false
        }
    }
    
    /**
     check the server has a next page or not
     
     - parameter void
     - returns: BOOL
     - warning: void
     
     */
    func nextPage() -> Bool {
        return paginateNext
    }
 
    /**
     Count for data source all Facilities
     
     - parameter void: void.
     - returns: Integer
     - warning: void
     
     */
    func count() -> Int {
        return facilities.count
    }
    /**
     dataSource  source all Facilities
     
     - parameter void: void.
     - returns: Facility model
     - warning: void
     
     */
    func dataSource() -> [FacilityModel.Datum] {
        return facilities
    }
    /**
     Fetch Facilities from API
     
     - parameter Void
     - returns: Void
     - warning: Void
     
     */
    func fetch() {
        NetworkManager.instance.paramaters["PageIndex"] = page ?? 1
        NetworkManager.instance.paramaters["PageSize"] = 10
        NetworkManager.instance.paramaters["departmentID"] = 2
        let request =  NetworkManager.instance.requestRaw("", type: .post, FacilityModel.self) { [weak self] response in
            switch response {
            case .success(let model):
                self?.paginate(model?.data ?? [])
                self?.facilities.append(contentsOf: model?.data ?? [])
                self?.facilitiesSuccess.value = true
            case .failure(let error):
                self?.facilitiesError.value = error?.localizedDescription
            }
        }
        requests.append(request)
    }
    
}

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
class FacilitiesVC: BaseController {
    // MARK:  Outlets
    @IBOutlet weak var facilitiesTbl: UITableView!
    
    // MARK:  Private VARS
    private var coordinator: FacilitiesCoordinator?
    
    // MARK:  VARS
    var viewModel: FacilitiesViewModel?
}

// MARK: - ...  LifeCycle
extension FacilitiesVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = .init()
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
extension FacilitiesVC {
    /**
     Setup view
     
     - parameter void: void.
     - returns: void
     - warning: void
     
     */
    func setup() {
        facilitiesTbl.register(UINib(nibName: "FacilityCell", bundle: nil), forCellReuseIdentifier: "FacilityCell")
        facilitiesTbl.delegate = self
        facilitiesTbl.dataSource = self
        animateTbl()
        viewModel?.fetch()
    }
    
    override func bind() {
        super.bind()
        viewModel?.facilitiesSuccess.bind({ [weak self] bool in
            self?.facilitiesTbl.tableFooterView?.isHidden = true
            self?.facilitiesTbl.reloadData()
        })
        viewModel?.facilitiesError.bind({ [weak self] error in
            self?.makeAlert(error, closure: {})
        })
    }
    
    func createIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.color = UIColor.white
        indicator.hidesWhenStopped = true
        return indicator
    }
    func animateTbl() {
        let indicator = createIndicator()
        indicator.startAnimating()
        facilitiesTbl.tableFooterView = indicator
        facilitiesTbl.tableFooterView?.isHidden = false
    }
    func swipeButtomRefresh(closure: @escaping (() -> Void)) {
        if (facilitiesTbl.contentOffset.y + facilitiesTbl.frame.size.height) >= facilitiesTbl.contentSize.height {
            animateTbl()
            closure()
        }
    }
}

// MARK: - ...  actions
extension FacilitiesVC {
   
}

// MARK:  Table view Delegate & DataSource
extension FacilitiesVC: UITableViewDelegate, UITableViewDataSource {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if case viewModel?.nextPage() = true {
            swipeButtomRefresh { [weak self] in
                self?.viewModel?.fetch()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell", for: indexPath) as! FacilityCell
        cell.model = viewModel?.dataSource()[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectedIndex = indexPath.row
        coordinator?.navigateToDetails()
    }
}

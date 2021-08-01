//
//  BaseController.swift
//
//  Created by mohamed abdo on 3/25/18.
//

import UIKit

class BaseController: UIViewController, Alertable {

    //This property for hide and unhide navigation bar
    var hideNav: Bool = false
    var networkScreen: NetworkFailScreen!
    
    // This action for any back for all pages
    @IBAction dynamic func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - ...  Base LifeCycle
extension BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.removeSubviews()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.view.semanticContentAttribute = .forceLeftToRight
        self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        self.setupBase()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.hideNav {
            // hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: false )
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
        self.navigationController?.navigationBar.removeSubviews()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.hideNav {
            // hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.navigationController?.navigationBar.shadowImage = UIImage()

        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
// MARK: - ...  binding
extension BaseController {
    @objc dynamic func bind() {
        
    }
}

// MARK: - ...  BaseViewProtocol
extension BaseController: BaseViewControllerProtocol {
    func setupBase() {
        //binding
    }
}
// MARK: - ...  PresentingView 
extension BaseController: PresentingViewProtocol {
    @objc func didError(error: String?) {
      
    }
}

// MARK: - ...  Network Fail 
extension BaseController: NetworkFailScreenContract {
    
}

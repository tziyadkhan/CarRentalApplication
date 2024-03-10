//
//  MainCoordinator.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginPageController()
        controller.coordinator = self
        navigationController.show(controller, sender: nil)
    }
    
    func showHomePage() {
        let controller = TabBarController()
        controller.coordinator = self
        navigationController.show(controller, sender: nil)
    }
    
    func showSearchPage() {
        let controller = SearchPageController()
        controller.coordinator = self
        navigationController.show(controller, sender: nil)
    }
}

//
//  TabBarController.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
    }
    
    func configureTabBar() {
        let vehicleController = VehiclePageController()
        vehicleController.tabBarItem = .init(title: "Vehicles",
                                             image: UIImage(named: "vehiclesTab"),
                                             tag: 0)
        let _ = UINavigationController(rootViewController: vehicleController)
        
        let searchController = SearchPageController()
        searchController.tabBarItem = .init(title: "Search",
                                             image: UIImage(named: "searchTab"),
                                             tag: 0)
        let _ = UINavigationController(rootViewController: searchController)
        UITabBar.appearance().backgroundColor = .white
        
        viewControllers = [vehicleController, searchController]
    }
}

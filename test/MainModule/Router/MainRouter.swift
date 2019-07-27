//
//  MainRouter.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol{
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    class func createMainModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "MainVC") as! UINavigationController
        guard let mainViewController = navController.topViewController as? MainViewController else { fatalError("Invalid View Controller") }
        let interacor: MainInteractorProtocol = MainInteractor()
        let router: MainRouterProtocol = MainRouter()
        let presentor: MainPresentorProtocol & MainInteractorToPresentorProtocol = MainPresentor()
        
        mainViewController.presentor = presentor
        presentor.view = mainViewController
        presentor.router = router
        presentor.interactor = interacor
        interacor.presentor = presentor
        
        return navController
    }
    
    func presentToDoDetailScreen(from view: MainViewProtocol, for news: News) {
        
        let detailVC = MainRouter.storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.news = news
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

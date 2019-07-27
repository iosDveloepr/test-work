//
//  MainProtocol's.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewProtocol: class{
    
    var presentor: MainPresentorProtocol? { get set }
    func showNews(news: [News])
    func showError()
}

protocol MainPresentorProtocol: class{
    
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    func showTodoDetail(_ news: News)
    func updateUI()
}

protocol MainInteractorProtocol: class{
    var presentor: MainInteractorToPresentorProtocol? { get set }
    func fetchNews(completion: @escaping () -> Void)
    func updateUI()
}

protocol MainInteractorToPresentorProtocol: class{
    func newsFetched(news: [News])
    func newsFailed()
}

protocol MainRouterProtocol: class{
    static func createMainModule() -> UIViewController
    func presentToDoDetailScreen(from view: MainViewProtocol, for news: News)
}

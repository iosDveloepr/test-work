//
//  MainPresentor.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation

class MainPresentor: MainPresentorProtocol{
   
    var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
    
    func updateUI() {
        interactor?.fetchNews()
    }
    
}

extension MainPresentor: MainInteractorToPresentorProtocol {
   
    func newsFetched(news: [News]){
        view?.showNews(news: news)
    }
    
    func newsFailed() {
        view?.showError()
    }
    
}


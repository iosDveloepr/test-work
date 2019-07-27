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
        interactor?.fetchNews(completion: {
            self.interactor?.updateUI()
        })
    }
    
    func showTodoDetail(_ news: News) {
        guard let view = view else { return }
        router?.presentToDoDetailScreen(from: view, for: news)
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


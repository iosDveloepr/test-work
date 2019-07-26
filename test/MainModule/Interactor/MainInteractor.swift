//
//  MainInteractor.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation
import Alamofire

class MainInteractor: MainInteractorProtocol{
  
    var presentor: MainInteractorToPresentorProtocol?
    
    func fetchNews() {
        Alamofire.request(Constants.URL, method: .get).responseJSON { (response) in
            if response.error == nil {
                guard let data = response.data else {return}
                do{
                    let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                    self.presentor?.newsFetched(news: newsData.articles)
                }
                catch{}
            } else {
                self.presentor?.newsFailed()
            }
        }
    }
    
}

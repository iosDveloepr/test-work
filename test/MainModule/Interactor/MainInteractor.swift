//
//  MainInteractor.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class MainInteractor: MainInteractorProtocol{
  
    var presentor: MainInteractorToPresentorProtocol?
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    func fetchNews() {
        Alamofire.request(Constants.URL, method: .get).responseJSON { (response) in
            if response.error == nil {
                guard let data = response.data else {return}
                do{
                    let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                    self.updateDatabase(with: newsData.articles)
                }
                catch{}
            } else {
                self.presentor?.newsFailed()
                self.updateUI()
            }
        }
    }
    
    private func updateDatabase(with news: [NewsModel]){
        container?.performBackgroundTask { context in
            for newsInfo in news{
                _ = try? News.findOrCreateNews(matching: newsInfo, in: context)
            }
            try? context.save()
            self.updateUI()
        }
    }
    
    
    func updateUI(){
        if let context = container?.viewContext{
            let request: NSFetchRequest<News> = News.fetchRequest()
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                presentor?.newsFetched(news: result)
            } catch {
                print("Failed")
            }
        }
    }
    
}

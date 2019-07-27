//
//  News.swift
//  test
//
//  Created by Anton Yermakov on 7/27/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import UIKit
import CoreData

class News: NSManagedObject {
    
    class func findOrCreateNews(matching newsInfo: NewsModel, in context: NSManagedObjectContext) throws -> News
    {
        let request: NSFetchRequest<News> = News.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", newsInfo.title)
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
               
                assert(matches.count == 1, "News.findOrCreateNews -- database inconsistency")
                return matches[0]
            }
        } catch {
            throw error
        }
        let news = News(context: context)
        news.author = newsInfo.author
        news.title = newsInfo.title
        news.desc = newsInfo.description
        news.url = newsInfo.url
        
        if let data = try? Data(contentsOf: URL(string: newsInfo.urlToImage)!){
            news.image = data
        }
        
        return news
    }
}

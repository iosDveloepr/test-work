//
//  News.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import Foundation

struct NewsModel: Decodable{
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
}

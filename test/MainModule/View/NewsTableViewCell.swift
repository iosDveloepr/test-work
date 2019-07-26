//
//  NewsTableViewCell.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    
    static let newsCell = "newsCell"
    
    func setUpCell(with news: News){
        newsImage.load(url: URL(string: news.urlToImage)!)
        newsTitle.text = news.title
        newsDescription.text = news.description
    }
    
    override func prepareForReuse() {
        newsImage.image = nil
        newsTitle.text = nil
        newsDescription.text = nil
    }

}

//
//  DetailViewController.swift
//  test
//
//  Created by Anton Yermakov on 7/27/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UITextView!
    
    var news: News!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newsTitle.text = news.title
        newsDescription.text = news.desc
        guard let image = news.image else { return }
        newsImage.image = UIImage(data: image)
    }
 

}

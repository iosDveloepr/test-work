//
//  ViewController.swift
//  test
//
//  Created by Anton Yermakov on 7/26/19.
//  Copyright © 2019 Anton Yermakov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presentor: MainPresentorProtocol?
    
    var news = [News](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presentor?.updateUI()
    }

}

extension MainViewController: MainViewProtocol{
    
    func showNews(news: [News]){
        self.news = news
    }
    
    func showError() {
        print("Error")
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.newsCell, for: indexPath) as! NewsTableViewCell
        let news = self.news[indexPath.row]
        cell.setUpCell(with: news)
        return cell
    }
    
}

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
    var refreshControl = UIRefreshControl()
    
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
        
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        presentor?.updateUI()
    }
    
    @objc func refresh(sender:AnyObject) {
        presentor?.updateUI()
        self.refreshControl.endRefreshing()
    }
    
}

extension MainViewController: MainViewProtocol{
    
    func showNews(news: [News]){
        self.news = news
    }
    
    func showError() {
        self.showAlert(title: "An error with updating news has occurred", message: "Check your internet connection")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = self.news[indexPath.row]
        presentor?.showTodoDetail(news)
    }
}

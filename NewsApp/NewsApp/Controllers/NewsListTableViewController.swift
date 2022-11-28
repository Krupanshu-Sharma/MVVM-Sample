//
//  NewsListTableViewController.swift
//  NewsApp
//
//  Created by Krupanshu Sharma on 28/11/22.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController {
    
    // Properties
    private var articleListViewModel : ArticleListViewModel!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        callWebservice()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func callWebservice() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2022-11-28&sortBy=popularity&apiKey=\(Config.API().apiKey)")!
        
        WebService().getArticles(url: url) { articles in
            
            if let articleList = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articleList)
        
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numbersOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
}

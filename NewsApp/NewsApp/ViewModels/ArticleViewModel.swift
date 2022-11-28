//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Krupanshu Sharma on 28/11/22.
//

import Foundation

struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}


// ArticleListViewModel

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    var numbersOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

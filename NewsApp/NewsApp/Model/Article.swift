//
//  Article.swift
//  NewsApp
//
//  Created by Krupanshu Sharma on 28/11/22.
//

import Foundation

struct ArticleList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let title: String
    let description: String?
//    let url: String
//    let urlToImage: String
//    let publishedAt: Date
//    let content: String
//
//    enum CodingKeys: String, CodingKey {
//        case source, author, title
//        case articleDescription = "description"
//        case url, urlToImage, publishedAt, content
//    }
}

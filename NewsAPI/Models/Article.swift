//
//  Article.swift
//  NewsAPI
//
//  Created by Mehmet on 14.08.2022.
//

import Foundation

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let content: String?

   
}

//
//  NewsModel.swift
//  News-App
//
//  Created by Иван Осипов on 17.02.2023.
//

import Foundation

struct JsonResponce: Decodable {
    let articles: [News]
}

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

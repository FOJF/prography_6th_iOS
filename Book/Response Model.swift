//
//  Response Model.swift
//  movie
//
//  Created by bug on 2020/03/03.
//  Copyright © 2020 jiwan. All rights reserved.
//

import Foundation

//MARK: -BookResponse
struct BookResponse: Codable {
    let error: String?
    let total: String?
    let page: String?
    let books: [Book]
}

//Mark: -Book
struct Book: Codable {
    let title: String?
    let subtitle: String?
    let isbn13: String?
    let price: String?
    let image: String?
    let url: String?
}

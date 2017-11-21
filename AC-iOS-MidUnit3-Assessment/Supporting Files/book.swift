//
//  book.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by Keshawn Swanston on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation


struct Book: Codable {
    var items: [ItemWrapper]
}

struct ItemWrapper: Codable {
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var description: String?
    var industryIdentifiers: [IndustryWrapper]?
    var imageLinks: [ImageWrapper]
    var retailPrice: RetailWrapper?
}

struct IndustryWrapper: Codable {
    var type: String
    var identifier: String
}

struct ImageWrapper: Codable{
    var thumbnail: String
    var smallThumbnail: String
}

struct  RetailWrapper: Codable {
    var amount: Double
    var currencyCode: String
}

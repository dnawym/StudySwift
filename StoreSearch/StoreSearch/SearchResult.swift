//
//  SearchResult.swift
//  StoreSearch
//
//  Created by YaMing on 11/10/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import Foundation

class SearchResult {
    var name = ""
    var artistName = ""
    var artworkURL60 = ""
    var artworkURL100 = ""
    var storeURL = ""
    var kind = ""
    var currency = ""
    var price = 0.0
    var genre = ""
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
    return lhs.name.localizedCompare(rhs.name) == NSComparisonResult.OrderedAscending
}

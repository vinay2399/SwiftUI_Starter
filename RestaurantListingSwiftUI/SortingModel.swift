//
//  SortingModel.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import Foundation

struct SortingModel {
    var id = UUID()
    var options: [String]
    
    init() {
        options = ["Popularity", "Distance: Nearest First", "Rating: High to Low", "Price: High to Low", "Price: Low to High"]
    }
}

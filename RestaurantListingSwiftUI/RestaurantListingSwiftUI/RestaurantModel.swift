//
//  RestaurantListModel.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 12/05/22.
//

import Foundation

struct RestaurantListModel {
    var List: [RestaurantModel]
}

struct RestaurantModel: Identifiable, Hashable {
    var id = UUID()
    var restaurantName: String
    var distance: String
    var locality: String
    var Cuisine: String
    var billEstimation: String
    var rating: String
    var offers: [String]
    var restaurantImages: [String]
    var outletCount: Int
    var chips: [String]
    
    init() {
        restaurantName = "Napa Dori Cafe"
        distance = "2.4 Kms"
        locality = "Chattarpur, Delhi"
        Cuisine = "Multicuisine"
        billEstimation = "1800"
        rating = "4.5"
        offers = ["30% off + 100 Off","30% off + 100 Off","30% off + 100 Off"]
        restaurantImages = ["restaurant1","restaurant2","restaurant3"]
        outletCount = 9
        chips = ["EazySafe","PayEazy","Prime"]
    }
}

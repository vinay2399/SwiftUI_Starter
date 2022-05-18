//
//  UserSearchModel.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import Foundation

struct UserSearchModel {
    var userLocation: String
    var date: String
    var meal: String
    
    init() {
        userLocation = "Cyber Hub, Gurgaon"
        date = "Today"
        meal = "Lunch"
    }
}

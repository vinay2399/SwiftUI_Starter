//
//  RestaurantImageCorouselView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import SwiftUI

struct RestaurantImageCorouselView: View {
    
    var images: [String]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach(images, id: \.self) { image in
                    
                    switch image {
                    case images.first:
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 215, height: 120)
                            .cornerRadius(8, corners: [.topLeft, .bottomLeft])
                    case images.last:
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 215, height: 120)
                            .cornerRadius(8, corners: [.topRight, .bottomRight])
                    default:
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 215, height: 120)
                            .clipped()
                    }
                }
            }
        }
    }
}


struct RestaurantImageCorouselView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantImageCorouselView(images: RestaurantModel().restaurantImages)
    }
}

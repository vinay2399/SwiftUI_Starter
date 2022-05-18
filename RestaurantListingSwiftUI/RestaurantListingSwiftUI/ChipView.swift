//
//  ChipView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import SwiftUI

struct ChipView: View {
    
    var chips: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                
                ForEach(chips, id: \.self) { title in
                    Text(title)
                        .font(.system(size:12))
                        .foregroundColor(.red)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 1, x: 0, y: 1)
                }
            }
            .padding(10)
        }
        .padding(.top, -38) // need to remove hardcoded value from here
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chips: RestaurantModel().chips)
    }
}

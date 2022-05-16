//
//  RestaurantListingView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 12/05/22.
//

import SwiftUI

struct RestaurantListingView: View {
    
    var model: RestaurantModel
    
    var body: some View {
        VStack(spacing: 10) {
            //image corousel
            ZStack(alignment: .topTrailing) {
                RestaurantImageCorouselView(images: model.restaurantImages)
                //like button
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 18, height: 17)
                        .padding(5)
                        .background(.white.opacity(0.5))
                        .cornerRadius(14)
                        .foregroundColor(.black)
                }
                .padding(6)
            }
            
            //chip view
            ChipView(chips: model.chips)
            
            // restaurant details view
            HStack(alignment: .top,spacing: 13) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(model.restaurantName)
                        .lineLimit(1)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    HStack(alignment: .center) {
                        Text(model.distance)
                            .font(.system(.subheadline))
                            .foregroundColor(.secondary)
                        Text("|")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                        Text(model.locality)
                            .font(.system(.subheadline))
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
                HStack {
                    Text("\(model.rating)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.trailing, -2)
                        .padding([.leading,.top,.bottom],6)
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                        .padding(.leading, -2)
                        .padding([.trailing,.top,.bottom],6)
                }
                .background(.green)
                .cornerRadius(14)
            }
            .padding([.leading,.trailing],10)
            
            //cuisine and estimate view
            HStack(alignment: .center, spacing: 10) {
                HStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .foregroundColor(.gray)
                    Text(model.Cuisine)
                        .font(.system(.subheadline))
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .foregroundColor(.gray)
                    Text("\(model.billEstimation) for 2 approx")
                        .font(.system(.subheadline))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.leading, 10)
            
            //deals view
            ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
                HStack {
                    HStack {
                        Image(systemName: "seal.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .frame(width: 18, height: 18)
                        Text(model.offers[0])
                            .foregroundColor(.orange)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                    }
                    Spacer()
                    if model.offers.endIndex-1 > 0 {
                        Text("\(model.offers.endIndex - 1) more deals")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(8)
                
            }
            .padding(4)
            .background(.gray.opacity(0.08))
            
            //more outlets view
            HStack {
                Text("\(model.outletCount) more outlets")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    // action
                } label: {
                    Text("View all >>")
                        .font(.subheadline)
                }
            }
            .padding([.leading,.trailing],10)
            Spacer()
        }
    }

}

struct RestaurantListingView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListingView(model: RestaurantModel())
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


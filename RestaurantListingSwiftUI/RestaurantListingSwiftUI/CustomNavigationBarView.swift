//
//  CustomNavigationBar.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    var model = UserSearchModel()
    
    var handleSortClick: () -> ()
    
    var body: some View {

        VStack (spacing: -5) {
            HStack(alignment: .top) {
                HStack {
                    Button {
                        //back action
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 12, height: 16)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .foregroundColor(.black)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Your Location")
                        HStack {
                            Text(model.userLocation)
                                .font(.system(size: 19))
                            Button {
                                //action
                            } label: {
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .frame(width: 12, height: 8)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                Spacer()
                Button {
                    //search action
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 22, height: 22)
                }
                .padding(5)
            }
            .padding()
            .padding(.leading,-10)
            HStack {
                HStack {
                    HStack(spacing: 10) {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 18, height: 18)
                        Text("\(model.date),")
                        Text(model.meal)
                    }
                    Spacer()
                    Button {
                        //action
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 18, height: 18)
                    }
                }
                .padding()
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5).stroke(.gray))
                HStack(alignment: .top,spacing: 0) {
                    Button {
                        //sorting
                        self.handleSortClick()
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .resizable()
                            .frame(width: 24, height: 19)
                            .foregroundColor(.black)
                    }
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 6, height: 6)
                        

                }
                .padding()
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5).stroke(.gray))
                ZStack() {
                    Button {
                        //sorting
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .frame(width: 24, height: 19)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5).stroke(.gray))
            }
            .padding()
        }
    }
    
}

//struct CustomNavigationBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavigationBarView()
//    }
//}

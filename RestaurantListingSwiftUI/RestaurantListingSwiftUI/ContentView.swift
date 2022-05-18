//
//  ContentView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 12/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var model = RestaurantListModel(List: Array.init(repeating: RestaurantModel(), count: 4))
    
    @State var cardShown: Bool = false
    @State var cardDismissal: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBarView(model: UserSearchModel(), handleSortClick: self.handleSortClicked)
                List(model.List, id: \.self) { restaurant in
                    
                    Section()  {
                            RestaurantListingView(model: restaurant)
                            .listRowSeparator(.hidden)
                            .cornerRadius(10)
                            .clipped()
                    }
                    .padding([.vertical], -5)
                    .padding([.horizontal],-20)
                }
                .shadow(color: Color(uiColor: .systemGray4), radius: 10, x: 0.1, y: 0.1)
                .background(Color.white)
            }
            
            BottomSheetView(cardShown: $cardShown, cardDismissal: $cardDismissal) {
                SheetContentView(model: SortingModel())
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

extension ContentView {
    func handleSortClicked() {
        cardShown.toggle()
        cardDismissal.toggle()
    }
}

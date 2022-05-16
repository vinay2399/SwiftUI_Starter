//
//  ContentView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 12/05/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var model = RestaurantListModel(List: Array.init(repeating: RestaurantModel(), count: 4))
    var subscriptions = Set<AnyCancellable>()
    
    @State var cardShown: Bool = false
    @State var cardDismissal: Bool = false
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBarView(model: UserSearchModel(), handleSortClick: self.handleSortClicked)
                List(model.List, id: \.self) { restaurant in
                    
                    Section() {
                        RestaurantListingView(model: restaurant)
                        .cornerRadius(8)
                        .listRowSeparator(.hidden)
                    }
                    .padding([.top,.bottom], -5)
                    .padding([.leading,.trailing],-20)
                }
                .background(.white)
            .listStyle(.automatic)
            }
            BottomSheetView(cardShown: $cardShown, cardDismissal: $cardDismissal) {
                SheetContentView(model: SortingModel())
                    .padding()
            }
        }
            
//        .overlay {
//            CustomNavigationBarView()
//                .background(.white)
//                .frame(maxHeight: .infinity, alignment: .top)
//        }
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

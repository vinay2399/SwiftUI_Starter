//
//  BottomSheetView.swift
//  RestaurantListingSwiftUI
//
//  Created by Eazydiner on 13/05/22.
//

import SwiftUI

struct BottomSheetView<Content: View >: View {
    
    let content: Content
    @Binding var cardShown: Bool
    @Binding var cardDismissal : Bool
    
    init(cardShown: Binding<Bool>,
         cardDismissal: Binding<Bool>,
         @ViewBuilder content: () -> Content)
    {
        _cardShown = cardShown
        _cardDismissal = cardDismissal
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.red.opacity(0.3))
            .opacity(cardShown ? 1 : 0)
            .animation(.easeIn)
            .onTapGesture {
                cardShown.toggle()
            }
            VStack {
                Spacer()
                
                VStack {
                    content
                }
                .background(Color.white)
                .offset(y: cardShown ? 0 : UIScreen.main.bounds.height)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SheetContentView: View {
    
    var model: SortingModel
    @State var selectedOption: String? = nil
    
    var body: some View {
        VStack{
            HStack {
                Text("SORT BY")
                    .font(.system(size: 20,weight: .semibold))
                Spacer()
                Button {
                    //action dismiss
                } label: {
                    HStack(spacing: 5) {
                        Text("Close")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        Image(systemName: "multiply")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            List(model.options, id: \.self) { option in
                OptionCellView(option: option, selectedOption: self.$selectedOption)
            }
            .listStyle(.plain)
            .frame(height: 240)
        }
    }
}

struct OptionCellView: View {
    
    let option: String
    @Binding var selectedOption: String?
    
    var body: some View {
        HStack{
            Text(option)
            Spacer()
            if option == selectedOption {
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
        }
        .onTapGesture {
            self.selectedOption = self.option
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetContentView(model: SortingModel())
    }
}

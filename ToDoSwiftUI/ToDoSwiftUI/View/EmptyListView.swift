//
//  EmptyListView.swift
//  ToDoSwiftUI
//
//  Created by Macbook on 18/02/21.
//

import SwiftUI

struct EmptyListView: View {
    @State private var isAnimated : Bool = false
    
    let images : [String] = [
    "illustration-no-1",
    "illustration-no-2",
    "illustration-no-3"
    ]
    
    let tips : [String] = [
    "Dattebayo",
    "Jotaro, Kissama Da",
    "Za Warudo"]
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 20){
                Image("\(images.randomElement() ?? self.images[0])")
                    .resizable()
                    .frame(minWidth: 255, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                Text("\(tips.randomElement() ?? self.tips[0])").font(.system(.headline, design: .rounded))
            }
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0) //bentuk if else yang lebih singkat
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5)) //animasi yg di awal nya muncul nya cepat di akhirnya lambat
            //.easeIn
            .onAppear(perform: {
                self.isAnimated.toggle()
            })
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView().environment(\.colorScheme, .dark)
    }
}

//
//  FormRowStaticView.swift
//  ToDoSwiftUI
//
//  Created by Macbook on 22/02/21.
//

// var name = ["joko","ayu","anwar"]
// var name = ["age":30,"ipk":38,5] = mame.age
// var name = (name: "joko") tapel hanya boleh 1 tipe data
import SwiftUI

struct FormRowStaticView: View {
    
    //model
    var icon: String
    var firstText: String
    var secondText: String
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText).foregroundColor(Color.gray)
            Spacer()
            Text(secondText)
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "Aplication", secondText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

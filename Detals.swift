//
//  Detals.swift
//  DataApp
//
//  Created by Ahmed Salah on 15/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct Detals : View{
    let userItem : datatype

    var body: some View{
        
        ScrollView{
            
            VStack{
                
                AnimatedImage(url: URL(string: userItem.image))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding()
                
                Text(userItem.name)
                    .font(.body)
                    .padding()
                Text(userItem.des)
                    .foregroundColor(.gray)
                    .padding()
            }
            
        }
    }
}



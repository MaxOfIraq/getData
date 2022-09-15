//
//  ContentView.swift
//  DataApp
//
//  Created by Ahmed Salah on 15/09/2022.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var obser = observer()
    @State var showApp = false
    
    
    var body: some View {
        NavigationView{
            List(obser.user){ i in
                NavigationLink(destination: Detals(userItem: i)) {
                    HStack{
                        AnimatedImage(url: URL(string: i.image))
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                        
                        Text(i.name)
                            .padding(.leading, 10)
                        
                    }
                }
            }.navigationBarTitle("Phone App")
                .navigationBarItems(trailing: Button(action: {
                    showApp.toggle()
                }, label: {
                    Image(systemName: "plus")
                }))
                .sheet(isPresented: $showApp) {
                    UploadData()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//
//  UploadData.swift
//  DataApp
//
//  Created by Ahmed Salah on 15/09/2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct UploadData : View{
    
    @State var UserName = ""
    @State var UserImage = ""
    @State var UserDes = ""
    
    
    @ObservedObject var obser = observer()
    var body: some View{
       
        VStack{
            TextField("Enter Name", text: $UserName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            TextField("Enter Des", text: $UserDes)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            TextField("Enter URL Image", text: $UserImage)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            
            Button("Upload Data"){
                self.AddInfo(name: UserName, image: UserImage, des: UserDes)
            }
            .frame(width: 150, height: 50)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        Spacer()
        
    }
    func AddInfo(name : String, image : String, des : String){
        let db = Firestore.firestore()
        db.collection("user").document().setData(["name": name, "des": des,"image": image])
    }
    
}

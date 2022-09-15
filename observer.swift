//
//  observer.swift
//  DataApp
//
//  Created by Ahmed Salah on 15/09/2022.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
import FirebaseStorage

class observer : ObservableObject{
    @Published var user = [datatype]()
    init(){
        
        
        let db = Firestore.firestore()
        
        db.collection("user").getDocuments{(snap , err) in
            if err != nil{
                print((err?.localizedDescription)!)
                
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                let des = i.get("des") as! String
                let image = i.get("image") as! String
                let id = i.documentID
                
                self.user.append(datatype(id: id, name: name, des: des, image: image))
            }
        }
    }
}

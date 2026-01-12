//
//  itemModel.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 28/11/25.
//

import Foundation
//Immutable struct
struct itemModel: Identifiable,Codable {
    let id :String
    let Title : String
    let iscompleted : Bool
    
    init(id:String = UUID().uuidString, title: String, iscompleted: Bool) {
        self.id = id
        self.Title = title
        self.iscompleted = iscompleted
    }
    func updateCompletion() -> itemModel {
        return itemModel(id: id,title: Title, iscompleted: !iscompleted)
    }
    
}
 

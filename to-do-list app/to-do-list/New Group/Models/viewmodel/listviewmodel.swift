//
//  listviewmodel.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 28/11/25.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items:[itemModel] = []{
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "item_list"
    
    init() {
        getitems()
    }
    func getitems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([itemModel].self, from:data)
        else {return}
        self.items = savedItem
        
        
    }
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = itemModel(title: title, iscompleted: false)
        items.append(newItem)
    }
    func updateItem (item: itemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    func saveItems (){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "items_list")
        }
    }
}

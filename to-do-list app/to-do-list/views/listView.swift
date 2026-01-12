//
//  listView.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 26/11/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel:ListViewModel
    
    
    var body: some View{
        ZStack{
            if listViewModel.items.isEmpty{
                noitemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                    
                                }
                            }
                    }
                    .onDelete(perform:listViewModel.deleteItem)
                    .onMove(perform:listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Todo list 📝")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination: add())
                )
            }
        }
    }
}
        
        #Preview {
            NavigationView{
                ListView()
            }
            .environmentObject(ListViewModel())
            
    }


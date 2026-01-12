//
//  ListRowView.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 26/11/25.
//

import SwiftUI

struct ListRowView: View {
    let item : itemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.iscompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.iscompleted ? .green : .red)
            Text(item.Title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical)
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var item1 = itemModel(title: "First item", iscompleted: false)
    static var item2 = itemModel(title: "Second item", iscompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

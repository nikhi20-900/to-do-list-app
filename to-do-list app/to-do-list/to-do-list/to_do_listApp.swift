//
//  to_do_listApp.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 26/11/25.
//

import SwiftUI

@main
struct to_do_listApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ListView()
        }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
    }
}
}

//
//  add.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 27/11/25.
//

import SwiftUI


struct add: View {
    @Environment(\..presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = " "
    @State var alertTitle: String = " "
    @State var showALert: Bool=false
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here.....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor
                        .secondarySystemBackground))
                    .cornerRadius(10)
                Button(action:saveButtonPressed,
                label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊️")
        .alert( isPresented: $showALert, content:getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            
            }
            
        }
        func textIsAppropriate() -> Bool{
            if textFieldText.count < 3{
                alertTitle = "Your new todo item must be atleast 3 characters long 😱😱😱!!"
                showALert.toggle()
                return false
            }
            return true
        }
        func getAlert () -> Alert{
            return Alert(title: Text(alertTitle))
        }
    }
    
    #Preview {
        Group{
            
            NavigationView{
                add()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            add()
        }
        .environmentObject(ListViewModel())
        .preferredColorScheme(.dark)
    }


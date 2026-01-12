//
//  noitemView.swift
//  to-do-list
//
//  Created by Nikhil chhetri on 10/12/25.
//
import SwiftUI
struct noitemView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("no items ")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("are you productive person? i think you should click the add button and add a bunch of things to your list!")
                    .padding(.bottom,20)
                NavigationLink(
                    destination:add(),
                               label: {
                    Text("add something 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal,animate ? 30 :50)
                .shadow(
                    color : animate ?  secondaryAccentColor.opacity(0.7):
                    Color.accentColor.opacity(0.7),
                    radius :10,
                    x:0,
                    y: animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimations)
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
    func addAnimations () {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
                                        
    }
    
}
#Preview {
    NavigationView{
        noitemView()
            .navigationTitle("title")
        
    }
}

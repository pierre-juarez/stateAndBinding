//
//  ContentView.swift
//  stateAndBinding
//
//  Created by Pierre Juarez U. on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title = "Example of states"
    var x1 = 2
    
    func sum() -> Int {
        title = "Change value" // If the variable comes from outside, the state is used.
        var x2 = 2 // It is created inside the function, the state is not used.
        x2 = 4
        return x2
    }
    
    @State private var show = true
    @State private var number = 0
    @State private var money = 120
    @State private var donation = ""
    
    var body: some View {
        VStack {
            Text(title).font(.largeTitle)
            HStack{
                Button {
                    show.toggle()
                    number += (show) ? -1: 1
                } label: {
                   
                    Image(systemName: (show) ? "heart" : "heart.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                    Text(String(number)).bold()
                }
                Button {
                    money += Int(donation)!
                    donation = String("")
                } label: {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                    
                }
                Text(String(money)).bold()
            }
            TextField("Enter donation", text:$donation)
                .keyboardType(.numberPad)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

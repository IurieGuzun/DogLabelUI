//
//  ContentView.swift
//  DogLabelUI
//
//  Created by Iurie Guzun on 2022-02-24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = Network()
    
    var body: some View {
        VStack {
            Spacer()
            Text(extractBreed(str: network.breed))
             .padding()
             .font(.title)
            
            Spacer()
            Spacer()
            Image(uiImage: network.dogImage ?? ContentView.dafaultImage!)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Spacer()
            Button(action: {
                print("Fetch Button has been pressed!")
                network.mainRequest()
            }) {
                Text("Fetch")
                .font(.title)
                .foregroundColor(.white)
               
            }
            .padding()
            .background(Color.gray)
            .clipShape(Capsule())
           
            Spacer()
        }.onAppear(perform: {network.mainRequest()})
    }
    
    static var dafaultImage = UIImage(named: "NoPhoto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GameStepFB
//
//  Created by 荀任之 on 2022/10/27.
//

import SwiftUI


struct ContentView: View {


  @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
          Text("Coins 0")
          Spacer()
          Text("Total steps so far:")
          Text("2100 Steps")
          Spacer()
          Text("Nov 10, 2022")
          Text("Today")
          Spacer()
          Button(action: {}) {
            Text("Play")
          }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  StepsHomeView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI


struct StepsHomeView: View {
  
  var body: some View {
      NavigationView {
        VStack {
          HStack {
            Text("Coins 0")
              .padding(10)
              .background(Color(hue: 0.67, saturation: 0.15, brightness: 0.93))
              .foregroundColor(.black)
              .clipShape(Capsule())
              .frame(width: 300, alignment: .leading)
            Button (action: {}) {
              Image(systemName: "arrow.clockwise")
            }
          }
          Spacer()
          Text("Total steps so far:")
          Text("2100 Steps")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.vertical, 3.0)
          Text("Nov 10, 2022")
          Text("Today")
          Spacer()
          NavigationLink(destination: GameSelectView()) {
            Text("Play")
              .padding()
              .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
              .foregroundColor(.black)
              .clipShape(Capsule())
          }
          Spacer()
        }
      }
  }
}

struct StepsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StepsHomeView()
    }
}

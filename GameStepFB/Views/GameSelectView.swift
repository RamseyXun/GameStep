//
//  GameSelectView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI

struct GameSelectView: View {
    var body: some View {
      VStack {
        Text("Coins 0")
          .padding(10)
          .background(Color(hue: 0.67, saturation: 0.15, brightness: 0.93))
          .foregroundColor(.black)
          .clipShape(Capsule())
          .frame(width: 300, alignment: .leading)
        Spacer()
        Text("Flappy Bird")
          .fontWeight(.bold)
        Text("Highest Score: N/A")
        Text("Earned: N/A")
          .fontWeight(.light)
          .foregroundColor(Color.gray)
        Spacer()
      }
    }
}

struct GameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectView()
    }
}

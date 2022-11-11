//
//  HomePopupView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI

struct HomePopupView: View {
  
  @State var showTabView: Bool = false
  @State private var displayPopupMessage: Bool = true
  
    var body: some View {
      NavigationView {
        VStack {
          NavigationLink(destination: HomeTabView(), isActive: self.$showTabView) {
            EmptyView()
          }
          Text("Coins 0")
            .padding(10)
            .background(Color(hue: 0.67, saturation: 0.15, brightness: 0.93))
            .foregroundColor(.black)
            .clipShape(Capsule())
            .frame(width: 300, alignment: .leading)
          Spacer()
          Text("+300 Steps")
            .frame(width: 300, alignment: .trailing)
          Text("1800 Steps")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.vertical, 3.0)
          Spacer()
        }.alert(isPresented: self.$displayPopupMessage) {
          Alert(title: Text("Congratulations"), message: Text("You earned 3 coins for the 300 steps since last time you opened the app."), dismissButton: .default(Text("Cheers!"), action: {
            print("Cheers Click")
            self.showTabView = true
          }))
        }
      }
    }
}

struct HomePopupView_Previews: PreviewProvider {
    static var previews: some View {
        HomePopupView()
    }
}

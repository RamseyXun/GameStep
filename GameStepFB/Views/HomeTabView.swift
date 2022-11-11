//
//  HomeTabView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI

struct HomeTabView: View {
  
    var body: some View {
        TabView {
          
          StepsHomeView()
            .tabItem {
              Image(systemName: "figure.walk")
            }
          GameSelectView()
            .tabItem {
              Image(systemName: "gamecontroller")
            }
          
        }.navigationBarBackButtonHidden(true)
      
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

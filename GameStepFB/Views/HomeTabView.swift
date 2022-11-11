//
//  HomeTabView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI

struct HomeTabView: View {
	let viewModel : ViewModel
		var body: some View {
				TabView {
					
					StepsHomeView(viewModel: viewModel)
						.tabItem {
							Image(systemName: "figure.walk")
						}
					GameSelectView(viewModel: viewModel)
						.tabItem {
							Image(systemName: "gamecontroller")
						}
					
				}.navigationBarBackButtonHidden(true)
			
		}
}



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
	let viewModel : ViewModel
		var body: some View {
			NavigationView {
				VStack {
					NavigationLink(destination: HomeTabView(viewModel: viewModel), isActive: self.$showTabView) {
						EmptyView()
					}
					Text("Coins 0")
						.padding(10)
						.background(Color(hue: 0.67, saturation: 0.15, brightness: 0.93))
						.foregroundColor(.black)
						.clipShape(Capsule())
						.frame(width: 300, alignment: .leading)
					// Spacer()
					Text("+\(Int(viewModel.currentStep))")
						.frame(width: 300, alignment: .trailing)
					Text("\(viewModel.user.totalSteps)")
						.font(.largeTitle)
						.fontWeight(.bold)
						.padding(.vertical, 3.0)
					Spacer()
					Spacer()
				}.alert(isPresented: self.$displayPopupMessage) {
					Alert(title: Text("Congratulations"), message: Text("You earned \(viewModel.theCoin) coins for the \(Int(viewModel.currentStep)-viewModel.user.totalSteps) steps since last time you opened the app."), dismissButton: .default(Text("Cheers!"), action: {
						print("Cheers Click")
						self.showTabView = true
						viewModel.user.coins += viewModel.theCoin
						viewModel.user.totalSteps = Int(viewModel.currentStep)
						viewModel.setCoin(_user: viewModel.user)
						viewModel.setSteps(_user: viewModel.user)
					}))
				}
			}
		}
}



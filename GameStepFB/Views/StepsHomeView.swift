//
//  StepsHomeView.swift
//  GameStepUI
//
//  Created by Claudia Feng on 11/10/22.
//

import SwiftUI


struct StepsHomeView: View {
	let viewModel : ViewModel
	var body: some View {
			NavigationView {
				VStack {
					HStack {
						Text("Coins \(viewModel.user.coins)")
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
					Text("\(Int(viewModel.currentStep)) Steps")
						.font(.largeTitle)
						.fontWeight(.bold)
						.padding(.vertical, 3.0)
					Text("Nov 11, 2022")
					Text("Today")
					Spacer()
					NavigationLink(destination: GameSelectView(viewModel: viewModel)) {
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


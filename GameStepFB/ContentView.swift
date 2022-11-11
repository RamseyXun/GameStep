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
			HomePopupView(viewModel: viewModel)
		}
	
	}
}



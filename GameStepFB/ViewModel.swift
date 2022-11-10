//
//  ViewModel.swift
//  GameStepFB
//
//  Created by 荀任之 on 2022/10/27.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var name: String
  var password: String
  var coins: Int
  var totalSteps: Int
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case password
    case coins
    case totalSteps
  }
  
}

class ViewModel: ObservableObject {
	private var healthStore: HealthStore?
	private let store = Firestore.firestore()
	@Published var user: User
	init() {
		self.user = User(name: "Nick", password: "123456", coins: 200, totalSteps: 0)
		self.user.totalSteps = Int(updateSteps())
		add(self.user)
		}
			
			func add(_ user: User) {
				do {
					let newUser = user
					_ = try store.collection("test").addDocument(from: newUser)
					print("added to database")
				} catch {
					fatalError("Unable to add book: \(error.localizedDescription).")
				}
			}
	func updateSteps()->Double{
		var currentStep: Double = 0
		if let healthStore = healthStore{
			healthStore.requestAuthorization { success in
				if success {
					healthStore.getSteps { unwrapp in
						currentStep = unwrapp
					}
				}
			}
		}
		return currentStep
	}
			
			
	
}

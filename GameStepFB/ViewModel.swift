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
	var healthStore: HealthStore?
	var currentStep: Double
	private let store = Firestore.firestore()
	@Published var user: User
	init() {
		self.healthStore = HealthStore()
		self.currentStep = 0
		self.user = User(name: "Nick", password: "123456", coins: 200, totalSteps: 0)
		self.updateSteps {
			self.user.totalSteps = Int(self.currentStep)
			print(self.user.totalSteps)
			self.add(self.user)
		}
		}
			
			func add(_ user: User) {
				do {
					let newUser = user
					_ = try store.collection("test").addDocument(data: [
						"name": user.name, "password": user.password, "coins": "200", "totalSteps": user.totalSteps
																														 ])
					print("added to database")
				} catch {
					fatalError("Unable to add book: \(error.localizedDescription).")
				}
			}
	
	func updateSteps( closure: @escaping () -> Void){
		if let healthStore = healthStore{
			
			healthStore.requestAuthorization { success in
				if success {
					healthStore.getSteps { unwrapp in
						self.currentStep = unwrapp
						print("inside " + String(self.currentStep))
						closure()
					}
					print("outside " + String(self.currentStep))
				}
				
			}
		}

	}
}

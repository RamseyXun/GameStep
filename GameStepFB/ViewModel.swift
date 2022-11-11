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
	var theCoin: Int
	private let store = Firestore.firestore()
	@Published var user: User
	//intialize with assumed user and password
	init() {
		self.healthStore = HealthStore()
		self.currentStep = 0
		self.theCoin = 0
		self.user = User(name: "NickMmwm", password: "123456", coins: 0, totalSteps: 0)
//		self.setCoin(_user: self.user)
//		self.setSteps(_user: self.user)
		//self.get()
		print("\(user.coins)")
		self.updateSteps {
//			self.user.totalSteps = Int(self.currentStep)
			self.theCoin = self.convertCoins()
//			self.user.coins = self.user.coins + self.theCoin
//			print(self.user.id)
//			print(self.user.totalSteps)
			
			//self.add(self.user)
//			self.setCoin(_user: self.user)
//			self.setSteps(_user: self.user)
		}
		}
			
	func add(_ user: User) {
			do {
				let newUser = user
				try store.collection("test").document(user.name).setData([
					"name": user.name,
					"password": user.password,
					"coins": 200,
					"totalSteps": user.totalSteps
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
//	func get() -> Bool {
//			let docRef = store.collection("test").document(self.user.name)
//			var res = true
//			docRef.getDocument(as: User.self) { result in
//					switch result {
//					case .success(let user):
//
//						self.user = user
//						print("success in get(), coins are " + String(user.coins))
//						res = true
//					case .failure(let error):
//
//						print("Error decoding document: \(error.localizedDescription)")
//						res = false
//					}
//				}
//
//			return res
//		}
	func setCoin(_user: User) {
		do {
			let newUser = user
			_ = try store.collection("test").document(newUser.name).setData( ["coins": newUser.coins], merge: true)
																												 
			print("set \(newUser.coins) coins to database")
		} catch {
			fatalError("Unable to add book: \(error.localizedDescription).")
		}
	}
	func setSteps(_user: User){
		do {
			let newUser = user
			_ = try store.collection("test").document(newUser.name).setData( ["totalSteps": newUser.totalSteps], merge: true)
																												 
			print("set \(newUser.totalSteps) steps to database")
		} catch {
			fatalError("Unable to add book: \(error.localizedDescription).")
		}
	}
	func convertCoins() -> Int{
		var thisCoin = (Int(self.currentStep)-self.user.totalSteps)/100
		//self.user.coins = self.user.coins + thisCoin
		return thisCoin
		
		}
	
}

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
  private let store = Firestore.firestore()
  @Published var user: User
  init() {
    self.user = User(name: "Ramsey", password: "123456", coins: 100, totalSteps: 10000)
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
}


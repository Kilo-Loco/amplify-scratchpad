// swiftlint:disable all
import Amplify
import Foundation

public struct Post: Model {
  public let id: String
  public var user: User
  public var text: String
  public var imageUrl: String
  public var createdTimestamp: Int
  
  public init(id: String = UUID().uuidString,
      user: User,
      text: String,
      imageUrl: String,
      createdTimestamp: Int) {
      self.id = id
      self.user = user
      self.text = text
      self.imageUrl = imageUrl
      self.createdTimestamp = createdTimestamp
  }
}
// swiftlint:disable all
import Amplify
import Foundation

extension Post {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case user
    case text
    case imageUrl
    case createdTimestamp
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let post = Post.keys
    
    model.pluralName = "Posts"
    
    model.fields(
      .id(),
      .field(post.user, is: .required, ofType: .customType(User.self)),
      .field(post.text, is: .required, ofType: .string),
      .field(post.imageUrl, is: .required, ofType: .string),
      .field(post.createdTimestamp, is: .required, ofType: .int)
    )
    }
}
import Foundation

public struct BlogPostsRequest: Decodable {
  public let posts: [BlogPost]
}

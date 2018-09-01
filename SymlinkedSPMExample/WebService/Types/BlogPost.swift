import Foundation

public struct BlogPost {
  public let title: String
  public let tags: [String]
}

// A contrived example of mapping a slightly awkward JSON structure from a remote server into
// simpler representations within our application.
//
// e.g. mapping from:
//
// {
//   "title" : "Some title",
//   "tags" : [
//      { "value" : "some tag" }
//   ]
// }
//
// into:
//
// BlogPost(title: "Some title", tags: ["some tag"])

extension BlogPost: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    title = try container.decode(String.self, forKey: .title)
    tags  = try container.decode([_Tag].self, forKey: .tags).map { $0.value }
  }
  
  struct _Tag: Decodable {
    let value: String
  }
  
  private enum CodingKeys: String, CodingKey {
    case title
    case tags
  }
}

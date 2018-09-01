import Foundation
import WebService

do {
  print(try JSONDecoder().decode(BlogPostsRequest.self, from: FileHandle.standardInput.readDataToEndOfFile()).posts)
} catch {
  print(error)
}

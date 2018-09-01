import Foundation

// Not a real server!!!
//
// Just an example of a type that handles interaction with an external service that
// returns JSON that is in an awkward format that we want to flatten e.g. we need
// custom decoding.
struct Server {
  func fetch(_ completion: (Data) -> Void) {
    completion(
      Data("""
      {
        "posts" : [
          {
            "title" : "A very interesting story",
            "tags" : [
              { "value" : "swift" },
              { "value" : "code" },
            ]
          },
          {
            "title" : "A not so interesting story",
            "tags" : [
              { "value" : "DIY" },
              { "value" : "painting" },
            ]
          }
        ]
      }
      """.utf8)
    )
  }
}

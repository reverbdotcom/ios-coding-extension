import Foundation

/// Represents a GraphQL Request for an arbitrary listings search.
struct ListingsSearchRequest: Encodable {
    /// Initializes a listings search request with an optional search query (e.g. "Fender Telecaster").
    init(searchQuery: String = "") {
        self.variables = ["query": searchQuery]
    }

    let variables: [String: String]
    let operationName = String(describing: Self.self)

    let query: String = """
      query ListingsSearchRequest($query: String) {
        listingsSearch(input: {query: $query}) {
          listings {
            id
            title
          }
        }
      }
    """
}

import Foundation

/// Represents a GraphQL Request for a listing detail page.
struct ListingDetailRequest: Encodable {
    /// Initializes a listings search request with a listing id
    init(listingID: String) {
        self.variables = ["id": listingID]
    }

    let variables: [String: String]
    let operationName = String(describing: Self.self)

    let query: String = """
      query ListingDetailRequest($id: String) {
        listing(input: {id: $id}) {
          id
          title
          price {
            display
          }
          shippingPrice {
            display
          }
          description
          images(input: {namedTransform: LARGE}) {
            source
          }
        }
      }
    """
}

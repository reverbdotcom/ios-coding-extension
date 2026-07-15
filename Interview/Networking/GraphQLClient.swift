import Foundation

/// An object on which to execute GraphQL requests to our remote database.
struct GraphQLClient {
    func perform(request: ListingsSearchRequest) async throws {
        let url = URL(string: "https://gql.reverb.com/graphql")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = try JSONEncoder().encode(request)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        // You won't get any shipping amount unless you set a region.
        urlRequest.setValue("US_CON", forHTTPHeaderField: "X-Shipping-Region")

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
    }
}

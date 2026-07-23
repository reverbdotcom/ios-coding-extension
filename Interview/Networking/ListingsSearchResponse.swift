import Foundation

/// Represents the JSON response of a ``ListingsSearchRequest``.
struct ListingsSearchResponse: Decodable {
    let data: ResponseData
}

extension ListingsSearchResponse {
    struct ResponseData: Decodable {
        let listingsSearch: ListingsSearch
    }
}

extension ListingsSearchResponse {
    struct ListingsSearch: Decodable {
        let listings: [Listing]

        struct Listing: Decodable {
            let id: String
            let title: String
        }
    }
}

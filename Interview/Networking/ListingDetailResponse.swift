import Foundation

/// Represents the JSON response of a ``ListingDetailRequest``.
struct ListingDetailResponse: Decodable {
    let data: ResponseData
}

extension ListingDetailResponse {
    struct ResponseData: Decodable {
        let listing: ListingDetail
    }
}

extension ListingDetailResponse {
    struct ListingDetail: Decodable {
        let id: String
        let title: String
        let description: String
        let price: Price
        let shippingPrice: ShippingPrice
        let images: [Image]

        struct Price: Decodable {
            let display: String
        }

        struct ShippingPrice: Decodable {
            let display: String
        }

        struct Image: Decodable {
            let source: URL?
        }
    }
}

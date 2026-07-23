import Foundation

/// Represents the JSON response of a ``ListingsDetailRequest``.

struct ListingsDetailResponse: Decodable {
    let data: ResponseData

    struct ResponseData: Decodable {
        let listing: ListingDetail

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
}

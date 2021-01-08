import Foundation

struct K {
    struct Dev {
        static let baseURL = "https://staging.ayvashopping.com"
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case apiKey = "ApiKey"
}

enum ContentType: String {
    case contentTypeValue = "application/x-www-form-urlencoded"
    case acceptTypeValue = "application/json"
    case apiKeyValue = "mgp55z>]8Ncg$7SJ!EJ<aQsw4@3*D:Bpx>"
}


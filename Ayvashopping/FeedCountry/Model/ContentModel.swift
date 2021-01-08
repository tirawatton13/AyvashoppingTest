import Foundation

struct ContentModel: Decodable {
    var status: Int?
    var content: CountryModel?
}

struct CountryModel: Decodable {
    var country: [Country]?
    var date: String?
}

struct Country: Codable {
    var id: Int
    var name: String
    var countryCode: String
    var dialCode: String
    var minPhoneLength: String
    var flagName: String
    var currencyName: String
    var currencySymbol: String
    var currencyCode: String
    var status: String

    var dialCodeString: String {
        return "+\(dialCode)"
    }
}

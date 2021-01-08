import Alamofire

enum APIRouter: URLRequestConvertible {

    case country

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .country:
            return .post
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .country:
            return "api/master"
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .country:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.Dev.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.apiKeyValue.rawValue, forHTTPHeaderField: HTTPHeaderField.apiKey.rawValue)
        urlRequest.setValue(ContentType.acceptTypeValue.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.contentTypeValue.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}


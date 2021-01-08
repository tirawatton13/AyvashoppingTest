import Alamofire

protocol CountryServiceProtocol {
    func fetchCountryData(completion: @escaping (ContentModel) -> Void)
}

class CountryService: CountryServiceProtocol {

    func fetchCountryData(completion: @escaping (ContentModel) -> Void) {
        APIClient.getCountry { result in
            switch result {
            case .success(let country):
                completion(country)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


import UIKit

final class FeedCountryViewModel {

    var reloadTableViewClosure: (()->())?
    var updateLoadingStatusClosure: (()->())?

    private var fillerCountries: [Country] = []

    private let service: CountryServiceProtocol
    private var countries: [Country] = [Country]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatusClosure?()
        }
    }

    var numberOfItems: Int {
        return fillerCountries.count
    }

    init(service: CountryServiceProtocol = CountryService()) {
        self.service = service
    }

    func fetchCountryData() {
        self.isLoading = true
        service.fetchCountryData { [weak self] result in
            guard let self = self else { return }
            self.countries = result.content?.country ?? []
            self.fillerCountries = self.countries
            self.isLoading = false
        }
    }

    func getCountry(at indexPath: IndexPath) -> Country {
        return fillerCountries[indexPath.row]
    }

    func filterCountries(for searchText: String, in tableView: UITableView, and searchBar: UISearchBar) {
        fillerCountries = []

        if searchText == "" {
            fillerCountries = countries
        } else {
            for country in countries {
                if country.name.lowercased().contains(searchText.lowercased()) || country.dialCodeString.lowercased().contains(searchText.lowercased()) {
                    fillerCountries.append(country)
                }
            }
        }

        tableView.reloadData()
    }
}



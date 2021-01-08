import UIKit

protocol CountrySearchBarListProtocol {
    func filterCountries(for searchText: String, in tableView: UITableView, and searchBar: UISearchBar)
}

class CountrySearchBarViewAdapter: NSObject {
    let delegate: CountrySearchBarListProtocol

    var tableView: UITableView

    init(delegate: CountrySearchBarListProtocol, tableView: UITableView) {
        self.delegate = delegate
        self.tableView = tableView
    }
}

extension CountrySearchBarViewAdapter: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate.filterCountries(for: searchText, in: tableView, and: searchBar)
    }
}



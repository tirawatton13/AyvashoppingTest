import UIKit

class CountryFeedViewController: UIViewController {

    private lazy var viewModel: FeedCountryViewModel = {
        return FeedCountryViewModel()
    }()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    static func instantiate(viewModel: FeedCountryViewModel) -> CountryFeedViewController {
        let viewController = UIStoryboard(name: .main, bundle: .main).instantiate(CountryFeedViewController.self)
        viewController.viewModel = viewModel
        return viewController
    }

    var tableViewAdapter: CountryTableViewAdapter!
    var searchBarAdapter: CountrySearchBarViewAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAdapter = CountryTableViewAdapter(delegate: self)
        searchBarAdapter = CountrySearchBarViewAdapter(delegate: self,
                                                       tableView: self.tableView)

        searchBar.delegate = searchBarAdapter

        initViewModel()
    }

    private func initViewModel() {
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.setupTableView()
            }
        }

        viewModel.updateLoadingStatusClosure = { [weak self] () in
            DispatchQueue.main.async {
                guard let self = self else { return }
                let isLoading = self.viewModel.isLoading
                self.setupSpinerLoader(set: isLoading)
            }
        }

        viewModel.fetchCountryData()
    }

    private func setupSpinerLoader(set isLoading: Bool) {
        if isLoading {
            self.activityIndicator.startAnimating()
            UIView.animate(withDuration: 0.2, animations: {
                self.tableView.alpha = 0.0
            })
        } else {
            self.activityIndicator.stopAnimating()
            UIView.animate(withDuration: 0.2, animations: {
                self.tableView.alpha = 1.0
                self.activityIndicator.alpha = 0
            })
        }
    }

    private func setupTableView() {
        tableView.dataSource = tableViewAdapter
        tableView.delegate = tableViewAdapter
        tableView.reloadData()
    }

    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CountryFeedViewController: CountryListProtocol {
    func getCountry(at: IndexPath) -> Country {
        return viewModel.getCountry(at: at)
    }

    func retrieveNumberOfSections()-> Int {
        return 1
    }

    func retrieveNumberOfItems()-> Int {
        return viewModel.numberOfItems
    }
}

extension CountryFeedViewController: CountrySearchBarListProtocol {
    func filterCountries(for searchText: String, in tableView: UITableView, and searchBar: UISearchBar) {
        viewModel.filterCountries(for: searchText, in: tableView, and: searchBar)
    }
}

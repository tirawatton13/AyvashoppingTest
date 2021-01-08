import UIKit

protocol CountryListProtocol {
    func getCountry(at: IndexPath)-> Country
    func retrieveNumberOfSections()->Int
    func retrieveNumberOfItems()->Int
}

class CountryTableViewAdapter: NSObject {
    let delegate: CountryListProtocol

    init(delegate: CountryListProtocol) {
        self.delegate = delegate
    }
}

extension CountryTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1 , reuseIdentifier: "subtitleCell")
        cell.textLabel!.text = delegate.getCountry(at: indexPath).name
        cell.detailTextLabel?.text = delegate.getCountry(at: indexPath).dialCodeString

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate.retrieveNumberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.retrieveNumberOfItems()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

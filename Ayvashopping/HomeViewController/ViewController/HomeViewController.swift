import UIKit

class HomeViewController: UIViewController {

    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! HomeViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let viewController = CountryFeedViewController.instantiate(viewModel: FeedCountryViewModel())
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}

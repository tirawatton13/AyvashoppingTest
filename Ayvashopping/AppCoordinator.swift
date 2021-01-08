import UIKit

class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func startRootViewController() {
        let viewController = HomeViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isTranslucent = false
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

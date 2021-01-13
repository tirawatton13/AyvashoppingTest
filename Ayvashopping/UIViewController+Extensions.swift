import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        String(describing: self)
    }
}

extension UIViewController: Identifiable {}

public protocol Instantiable: AnyObject {
    static func instantiate() -> Self
}

extension Instantiable where Self: UIViewController {
    public static func instantiate() -> Self {
        return Self(nibName: nil, bundle: nil)
    }
}

extension UIViewController: Instantiable {}

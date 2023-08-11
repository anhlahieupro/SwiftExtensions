import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.className)")
        }
        
        return cell
    }
}

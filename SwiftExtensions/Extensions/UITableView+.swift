import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.className)")
        }
        
        return cell
    }
    
    /// SwifterSwift: Remove TableFooterView.
    func removeTableFooterView() {
        tableFooterView = nil
    }
    
    /// SwifterSwift: Remove TableHeaderView.
    func removeTableHeaderView() {
        tableHeaderView = nil
    }
    
    /// SwifterSwift: Reload data with a completion handler.
    ///
    /// - Parameter completion: completion handler to run after reloadData finishes.
    func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    /// SwifterSwift: Check whether IndexPath is valid within the tableView.
    ///
    /// - Parameter indexPath: An IndexPath to check.
    /// - Returns: Boolean value for valid or invalid IndexPath.
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0 &&
        indexPath.row >= 0 &&
        indexPath.section < numberOfSections &&
        indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    
    /// SwifterSwift: Safely scroll to possibly invalid IndexPath.
    ///
    /// - Parameters:
    ///   - indexPath: Target IndexPath to scroll to.
    ///   - scrollPosition: Scroll position.
    ///   - animated: Whether to animate or not.
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
}

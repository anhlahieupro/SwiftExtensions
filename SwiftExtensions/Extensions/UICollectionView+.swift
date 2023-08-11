import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(UINib(nibName: T.className, bundle: nil),
                 forCellWithReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.className)")
        }
        
        return cell
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
    
    /// SwifterSwift: Check whether IndexPath is valid within the CollectionView.
    ///
    /// - Parameter indexPath: An IndexPath to check.
    /// - Returns: Boolean value for valid or invalid IndexPath.
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0 &&
        indexPath.item >= 0 &&
        indexPath.section < numberOfSections &&
        indexPath.item < numberOfItems(inSection: indexPath.section)
    }
    
    /// SwifterSwift: Safely scroll to possibly invalid IndexPath.
    ///
    /// - Parameters:
    ///   - indexPath: Target IndexPath to scroll to.
    ///   - scrollPosition: Scroll position.
    ///   - animated: Whether to animate or not.
    func safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        guard indexPath.item >= 0,
              indexPath.section >= 0,
              indexPath.section < numberOfSections,
              indexPath.item < numberOfItems(inSection: indexPath.section) else {
            return
        }
        scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }
}

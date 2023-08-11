import UIKit

extension UICollectionView {
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
}

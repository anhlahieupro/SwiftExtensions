import Foundation

public extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

import UIKit

public extension UITextField {
    func trim() {
        self.text = self.text?.trimmed
    }
    
    /// SwifterSwift: Clear text.
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    /// SwifterSwift: Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder,
                                                   attributes: [.foregroundColor: color])
    }
    
    /// SwifterSwift: Check if text field is empty.
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    var isValidEmail: Bool {
        return text?.isValidEmail == true
    }
}

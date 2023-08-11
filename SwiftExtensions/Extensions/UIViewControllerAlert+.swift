import UIKit

public extension UIViewController {
    // self.show(error: error.localizedDescription)
    // self.show(warning: "Please accept our Terms to continue")
    
    func show(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func show(warning: String) {
        let alert = UIAlertController(title: "Warning", message: warning, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

public extension UIViewController {
    // self.ask(title: "Your name",
    // question: "What is your name?",
    // placeholder: "Enter it here") { (name) in
    // print(name)
    // }
    
    func ask(title: String?,
             question: String?,
             placeholder: String?,
             keyboardType: UIKeyboardType = .default,
             delegate: @escaping (_ answer: String?) -> Void) {
        
        let alert = UIAlertController(title: title, message: question, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
            textField.keyboardType = keyboardType
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            let answer = alert.textFields?.first?.text
            delegate(answer)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            delegate(nil)
        })
        present(alert, animated: true, completion: nil)
    }
    
    
    // self.ask(title: "Register a new user",
    // question: "Would you like to continue?") { (agreed) in
    // if agreed { }
    // }
    
    func ask(title: String?,
             question: String?,
             positiveButtonTitle: String = "Yes",
             negativeButtonTitle: String = "No",
             isDangerousAction: Bool = false,
             delegate: @escaping (_ agreed: Bool) -> Void) {
        
        let alert = UIAlertController(title: title, message: question, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: positiveButtonTitle, style: isDangerousAction ? .destructive : .default) { (_) in
            delegate(true)
        })
        alert.addAction(UIAlertAction(title: negativeButtonTitle, style: .cancel) { (_) in
            delegate(false)
        })
        present(alert, animated: true, completion: nil)
    }
}

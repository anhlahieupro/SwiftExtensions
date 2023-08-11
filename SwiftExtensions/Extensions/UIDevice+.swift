import UIKit
import AudioToolbox

public extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(1519)
    }
}

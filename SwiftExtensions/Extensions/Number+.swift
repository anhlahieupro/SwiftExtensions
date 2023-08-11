import Foundation

public extension String {
    func toInt() -> Int {
        Int(self)!
    }
    
    func toIntOrNull() -> Int? {
        Int(self)
    }
}

public extension Int {
    func toString() -> String {
        "\(self)"
    }
    
    func toDouble() -> Double {
        Double(self)
    }
}

public extension Double {
    func toString() -> String {
        String(format: "%.02f", self)
    }
    
    func toInt() -> Int {
        Int(self)
    }
}

public extension Double {
    func toPrice(currency: String) -> String {
        let nf = NumberFormatter()
        nf.decimalSeparator = ","
        nf.groupingSeparator = "."
        nf.groupingSize = 3
        nf.usesGroupingSeparator = true
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return (nf.string(from: NSNumber(value: self)) ?? "?") + currency
    }
}

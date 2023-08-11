import Foundation

public extension Date {
    func toUTCTimeZoneDateString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = dateFormat
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: self)
    }
    
    func toLocalDateString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        // dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = dateFormat
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: self)
    }
    
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func getWeekOfYear() -> Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
}

public extension Date {
    func add(years: Int) -> Date? {
        return Calendar.current.date(byAdding: .year,
                                     value: years,
                                     to: self)
    }
    
    func add(months: Int) -> Date? {
        return Calendar.current.date(byAdding: .month,
                                     value: months,
                                     to: self)
    }
    
    func add(days: Int) -> Date? {
        return Calendar.current.date(byAdding: .day,
                                     value: days,
                                     to: self)
    }
    
    func add(hours: Int) -> Date? {
        return Calendar.current.date(byAdding: .hour,
                                     value: hours,
                                     to: self)
    }
    
    func add(minutes: Int) -> Date? {
        return Calendar.current.date(byAdding: .minute,
                                     value: minutes,
                                     to: self)
    }
    
    func add(seconds: Int) -> Date? {
        return Calendar.current.date(byAdding: .second,
                                     value: seconds,
                                     to: self)
    }
}

public extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

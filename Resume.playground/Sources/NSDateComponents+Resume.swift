import Foundation

public extension NSDateComponents {
    public convenience init(month: Int, year: Int) {
        self.init()
        self.calendar = NSCalendar.currentCalendar()
        self.month = month
        self.year = year
    }
}

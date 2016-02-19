import Foundation

extension NSDate: MarkDownRenderable {
    
    public func renderMarkDown() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "MMMM ''yy"
        return dateFormatter.stringFromDate(self)
    }
}
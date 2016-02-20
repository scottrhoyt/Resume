import Foundation

extension NSDate: MarkdownRenderable {
    public class func current() -> NSDate {
        return NSDate.distantFuture()
    }
    
    public func renderMarkdown() -> String {
        if self == NSDate.current() {
            return "Current"
        } else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat = "MMMM ''yy"
            return dateFormatter.stringFromDate(self)
        }
    }
}

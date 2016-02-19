import Foundation

extension NSDate: MarkdownRenderable {
    
    public func renderMarkdown() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "MMMM ''yy"
        return dateFormatter.stringFromDate(self)
    }
}
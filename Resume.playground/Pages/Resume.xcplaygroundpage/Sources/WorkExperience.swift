import Foundation

public struct WorkExperience: MarkdownRenderable {
    let companyName: String
    let title: String
    let startDate: NSDate
    let endDate: NSDate
    let notables: [String]
    
    public init(companyName: String, title: String, startDate: NSDate, endDate: NSDate, notables: [String]) {
        self.companyName = companyName
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.notables = notables
    }
}
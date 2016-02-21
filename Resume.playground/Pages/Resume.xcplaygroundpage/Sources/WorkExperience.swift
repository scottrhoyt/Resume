import Foundation

public struct WorkExperience: MarkdownRenderable {
    let companyName: String
    let title: String
    let startDate: NSDate
    let endDate: NSDate
    let highlights: [String]
    
    public init(companyName: String, title: String, startDate: NSDate, endDate: NSDate, highlights: [String]) {
        self.companyName = companyName
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.highlights = highlights
    }
}

extension WorkExperience: HasMarkdownTitleField {
    func markdownTitleField() -> String {
        return "companyName"
    }
}
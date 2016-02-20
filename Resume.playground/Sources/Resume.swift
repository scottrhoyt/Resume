import Foundation

public struct ResumeSection: MarkdownRenderable {
    let title: String?
    let body: MarkdownRenderable
    
    public init(title: String? = nil, body: MarkdownRenderable) {
        self.title = title
        self.body = body
    }
    
    public func renderMarkdown() -> String {
        let titleString = title?.heading(3) ?? ""
        let titleSeparator = title != nil ? "\n" : ""
        return "\(titleString)\(titleSeparator)\(body.renderMarkdown())"
    }
}

public struct Resume: MarkdownRenderable {
    let title: String
    let sections: [ResumeSection]
    
    public init(title: String, sections: [ResumeSection]) {
        self.title = title
        self.sections = sections
    }
    
    public func renderMarkdown() -> String {
        let titleString = title.heading(2)
        let sectionsString = sections.map{ $0.renderMarkdown() }.joinWithSeparator("\n\n")
        return [titleString, sectionsString].joinWithSeparator("\n\n")
    }
}

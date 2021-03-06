import Foundation

public struct ResumeSection: MarkdownRenderable {
    let title: String?
    let body: MarkdownRenderable
    
    public init(title: String? = nil, body: MarkdownRenderable) {
        self.title = title
        self.body = body
    }
    
    public func renderMarkdown(depth: Int) -> String {
        let titleString = title?.heading(3) ?? ""
        let titleSeparator = title != nil ? "\n\n" : ""
        return "\(titleString)\(titleSeparator)\(body.renderMarkdown(0))"
    }
}

public struct Resume: MarkdownRenderable {
    let title: String
    let sections: [ResumeSection]
    
    public init(title: String, sections: [ResumeSection]) {
        self.title = title
        self.sections = sections
    }
    
    public func renderMarkdown(depth: Int = 0) -> String {
        let titleString = title.heading(2)
        let sectionsString = sections.map{ $0.renderMarkdown(0) }.joinWithSeparator("\n\n----\n")
        return [titleString, sectionsString].joinWithSeparator("\n\n")
    }
}

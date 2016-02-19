import Foundation

public struct ResumeSection: MarkdownRenderable {
    let title: String
    let body: MarkdownRenderable
    
    public init(title: String, body: MarkdownRenderable) {
        self.title = title
        self.body = body
    }
}

public struct Resume: MarkdownRenderable {
    let sections: [ResumeSection]
    
    public init(sections: [ResumeSection]) {
        self.sections = sections
    }
    
    public func renderMarkdown() -> String {
        return sections.map{ "## \($0.title)\n\($0.body.renderMarkdown())" }.joinWithSeparator("\n\n")
    }
}

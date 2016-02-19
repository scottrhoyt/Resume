import Foundation

public struct ResumeSection: MarkDownRenderable {
    let title: String
    let body: MarkDownRenderable
    
    public init(title: String, body: MarkDownRenderable) {
        self.title = title
        self.body = body
    }
}

public struct Resume: MarkDownRenderable {
    let sections: [ResumeSection]
    
    public init(sections: [ResumeSection]) {
        self.sections = sections
    }
    
    public func renderMarkDown() -> String {
        return sections.map{ "## \($0.title)\n\($0.body.renderMarkDown())" }.joinWithSeparator("\n\n")
    }
}

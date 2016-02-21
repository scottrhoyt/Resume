import Foundation

extension String {
    func uncamel() -> String {
        return stringByReplacingOccurrencesOfString(
            "([a-z])([A-Z])",
            withString: "$1 $2",
            options: .RegularExpressionSearch,
            range: Range<String.Index>(start: startIndex, end: endIndex)
        )
    }
    
    func titleString() -> String {
        return uncamel().capitalizedString
    }
    
    func bold() -> String {
        return "**\(self)**"
    }
    
    func bullet() -> String {
        return "+ \(self)"
    }
    
    func heading(level: Int) -> String {
        let mark = Repeat(count: level, repeatedValue: "#").joinWithSeparator("")
        return "\(mark) \(self)"
    }
    
    func newLineIfNeeded(depth: Int) -> String {
        return depth == 0 ? self : "\n" + self
    }
}

// MARK: - MarkdownRenderable

extension String: MarkdownRenderable {
    public func renderMarkdown(depth: Int) -> String {
        return self
    }
}

extension Double: MarkdownRenderable {
    public func renderMarkdown(depth: Int) -> String {
        return self.description
    }
}
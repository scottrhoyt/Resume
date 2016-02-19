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
}

// MARK: - MarkdownRenderable

extension String: MarkdownRenderable {
    public func renderMarkdown() -> String {
        return self
    }
}

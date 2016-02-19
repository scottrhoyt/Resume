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

// MARK: - MarkDownRenderable

extension String: MarkDownRenderable {
    public func renderMarkDown() -> String {
        return self
    }
}

import Foundation

public protocol MarkdownRenderable {
    func renderMarkdown() -> String
}

// MARK: - Default Implementation

public extension MarkdownRenderable {
    public func renderMarkdown() -> String {
        let mirror = Mirror(reflecting: self)
        let result = mirror.children.filter {
            $0.label != nil && $0.value is MarkdownRenderable
        }.map {
            ($0.label!, $0.value as! MarkdownRenderable)
        }.map(keyValueString).joinWithSeparator("\n")
        
        return result
    }
    
    private func keyValueString(keyValue: (String, MarkdownRenderable)) -> String {
        return "\(keyValue.0.titleString().bold()): \(keyValue.1.renderMarkdown())".bullet()
    }
    
    private func indent(strings: [String], depth: Int) -> [String] {
        let padding = Repeat(count: 2 * depth, repeatedValue: " ").joinWithSeparator("")
        let paddedStrings = strings.map { padding + $0 }
        return paddedStrings
    }
}

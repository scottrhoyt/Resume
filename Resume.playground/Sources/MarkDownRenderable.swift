import Foundation

public protocol MarkdownRenderable {
    func renderMarkdown() -> String
}

// MARK: - Default Implementation

public extension MarkdownRenderable {
    public func renderMarkdown() -> String {
        var markdowns = [String]()
        let mirror = Mirror(reflecting: self)
        // TODO: Use Map
        for child in mirror.children {
            if
                let label = child.label,
                let value = child.value as? MarkdownRenderable
            {
                markdowns.append("* **\(label.titleString())**: \(value.renderMarkdown())")
            }
        }
        return markdowns.joinWithSeparator("\n")
    }
    
    private func indent(strings: [String], depth: Int) -> [String] {
        let padding = Repeat(count: 2 * depth, repeatedValue: " ").joinWithSeparator("")
        let paddedStrings = strings.map { padding + $0 }
        return paddedStrings
    }
}

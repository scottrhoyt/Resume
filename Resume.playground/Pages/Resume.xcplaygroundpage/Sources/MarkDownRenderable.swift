import Foundation

public protocol MarkdownRenderable {
    func renderMarkdown(depth: Int) -> String
}

protocol HasMarkdownTitleField {
    func markdownTitleField() -> String
}

// MARK: - Default Implementation

public extension MarkdownRenderable {
    public func renderMarkdown(depth: Int) -> String {
        let mirror = Mirror(reflecting: self)
        
        let titleField = (self as? HasMarkdownTitleField)?.markdownTitleField()
        var result = [mirror.titleString(titleField)]
        
        result += mirror.children.filter {
            $0.label != nil && $0.value is MarkdownRenderable && $0.label != titleField
        }.map {
            ($0.label!, $0.value as! MarkdownRenderable, depth)
        }.map(keyValueString)
        
        return indent(result, depth: depth).joinWithSeparator("\n")
    }
    
    private func keyValueString(keyValue: (String, MarkdownRenderable, Int)) -> String {
        return "\(keyValue.0.titleString().bold()): \(keyValue.1.renderMarkdown(keyValue.2 + 1))".bullet()
    }
    

    
    func indent(strings: [String], depth: Int) -> [String] {
        let padding = Repeat(count: 2 * depth, repeatedValue: " ").joinWithSeparator("")
        let paddedStrings = strings.map { padding + $0 }
        return paddedStrings
    }
}

// MARK: - Mirror

extension Mirror {
    private func titleString(titleField: String?) -> String {
        guard let titleField = titleField else {
            return ""
        }
        
        let value = self.children.filter {
            $0.label == titleField
        }.first?.value
        
        return (value as? MarkdownRenderable)?.renderMarkdown(0).bold() ?? ""
    }
}

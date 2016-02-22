import Foundation

extension Array: MarkdownRenderable {
    public func renderMarkdown(depth: Int) -> String {
        let result = flatMap{ renderElement($0, depth: depth) }
        return indent(result, depth: depth).joinWithSeparator("\n").newLineIfNeeded(depth)
    }
    
    private func renderElement(element: Any, depth: Int) -> String? {
        var result: String? = nil
        if let element = element as? MarkdownRenderable {
            result = element.renderMarkdown(depth + 1)
        } else if let element = element as? CustomStringConvertible {
            result = element.description
        }
        return result?.bullet()
    }
}

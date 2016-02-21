import Foundation

extension Array: MarkdownRenderable {
    public func renderMarkdown(depth: Int) -> String {
        let result = map{ renderElement($0, depth: depth) }
        return indent(result, depth: depth).joinWithSeparator("\n").newLineIfNeeded(depth)
    }
    
    private func renderElement(element: Any, depth: Int) -> String {
        var result: String
        if let element = element as? MarkdownRenderable {
            result = element.renderMarkdown(depth + 1)
        } else {
            result = Mirror(reflecting: element).description
        }
        return result.bullet()
    }
}
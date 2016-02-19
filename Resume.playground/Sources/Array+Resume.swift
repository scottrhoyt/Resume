import Foundation

extension Array: MarkdownRenderable {
    public func renderMarkdown() -> String {
        let result = map(renderElement).joinWithSeparator("\n")
        return result
    }
    
    private func renderElement(element: Any) -> String {
        var result: String
        if let element = element as? MarkdownRenderable {
            result = element.renderMarkdown()
        } else {
            result = Mirror(reflecting: element).description
        }
        return result.bullet()
    }
}

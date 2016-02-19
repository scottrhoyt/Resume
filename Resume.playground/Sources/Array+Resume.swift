import Foundation

extension Array: MarkdownRenderable {
    public func renderMarkdown() -> String {
        let result = map(renderElement).joinWithSeparator("\n")
        return result
    }
    
    private func renderElement(element: Any) -> String {
        if let element = element as? MarkdownRenderable {
            return element.renderMarkdown().bullet()
        } else {
            return Mirror(reflecting: element).description.bullet()
        }
    }
}

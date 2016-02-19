import Foundation

extension Array: MarkdownRenderable {
    public func renderMarkdown() -> String {
        var markdowns = [""]
        // TODO: Use Map
        for item in self {
            if let item = item as? MarkdownRenderable {
                markdowns.append("* " + item.renderMarkdown())
            } else {
                markdowns.append("* " + Mirror(reflecting: item).description)
            }
        }
        return markdowns.joinWithSeparator("\n")
    }
}

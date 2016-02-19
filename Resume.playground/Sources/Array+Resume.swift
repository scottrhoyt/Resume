import Foundation

extension Array: MarkDownRenderable {
    public func renderMarkDown() -> String {
        var markdowns = [""]
        // TODO: Use Map
        for item in self {
            if let item = item as? MarkDownRenderable {
                markdowns.append("* " + item.renderMarkDown())
            } else {
                markdowns.append("* " + Mirror(reflecting: item).description)
            }
        }
        return markdowns.joinWithSeparator("\n")
    }
}

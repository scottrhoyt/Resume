import Foundation

public protocol MarkDownRenderable {
    func renderMarkDown() -> String
}

// MARK: - Default Implementation

public extension MarkDownRenderable {
    public func renderMarkDown() -> String {
        var markdowns = [String]()
        let mirror = Mirror(reflecting: self)
        // TODO: Use Map
        for child in mirror.children {
            if
                let label = child.label,
                let value = child.value as? MarkDownRenderable
            {
                markdowns.append("* **\(label.titleString())**: \(value.renderMarkDown())")
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

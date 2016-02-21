import Foundation

public struct Education: MarkdownRenderable {
    let institution: String
    let major: String
    let minor: String
    let graduationDate: NSDate
    let gpa: Double
    let highlights: [String]
    
    public init(institution: String, major: String, minor: String, graduationDate: NSDate, gpa: Double, highlights: [String]) {
        self.institution = institution
        self.major = major
        self.minor = minor
        self.graduationDate = graduationDate
        self.gpa = gpa
        self.highlights = highlights
    }
}
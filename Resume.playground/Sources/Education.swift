import Foundation

public struct Education: MarkDownRenderable {
    let institution: String
    let major: String
    let minor: String
    let graduationDate: NSDate
    let notables: [String]
    
    public init(institution: String, major: String, minor: String, graduationDate: NSDate, notables: [String]) {
        self.institution = institution
        self.major = major
        self.minor = minor
        self.graduationDate = graduationDate
        self.notables = notables
    }
}
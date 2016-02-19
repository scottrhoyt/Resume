import Foundation

public struct Bio: MarkdownRenderable {
    let name: String
    let location: String
    let email: String
    let phoneNumber: String
    
    public init(name: String, location: String, email: String, phoneNumber: String) {
        self.name = name
        self.location = location
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
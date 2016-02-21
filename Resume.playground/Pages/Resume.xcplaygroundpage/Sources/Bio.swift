import Foundation

public struct Bio: MarkdownRenderable {
    let location: String
    let email: String
    let phoneNumber: String
    
    public init(location: String, email: String, phoneNumber: String) {
        self.location = location
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
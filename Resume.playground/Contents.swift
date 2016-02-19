import WebKit
import XCPlayground

//: # Resume

//: ## Bio

let bio = Bio(
    name: "Scott Hoyt",
    location: "Los Angeles, CA",
    email: "scottrhoyt@gmail.com",
    phoneNumber: "708.704.6804"
)

//: ## Education

let uiuc = Education(
    institution: "University of Illinois Urbana Champaign",
    major: "Computer Engineering",
    minor: "Business",
    graduationDate: { NSDateComponents(month: 6, year: 2006).date! }(),
    gpa: 3.92,
    notables: []
)

//: ## Work Experience

let ctc = WorkExperience(
    companyName: "Chicago Trading Company",
    title: "Senior Financial Engineer",
    startDate: { NSDateComponents(month: 7, year: 2006).date! }(),
    endDate: { NSDateComponents(month: 3, year: 2009).date! }(),
    notables: [
        "Designed and developed GPGPU interest rate model for a new relative value trade. (Matlab, C, C#)",
        "Lead financial engineering for interest rate products."
    ]
)

let blackEdge = WorkExperience(
    companyName: "Black Edge Capital",
    title: "Cofounder",
    startDate: { NSDateComponents(month: 3, year: 2009).date! }(),
    endDate: { NSDateComponents(month: 3, year: 2011).date! }(),
    notables: [
        "Designed and developed risk and trading software. (Matlab, C#)",
        "Grew company to 13 employees",
        "Best Year: $9M in profit. ~1800% Return on Capital"
    ]
)

//: ## Interests
let interests = [
    "Flying",
    "Sailing",
    "Guitar",
    "Rock Climbing",
    "Mountaineering",
    "Hiking",
    "Homebrewing"
]


let resume = Resume(
    sections: [
        ResumeSection(title: "Scott Hoyt", body: bio),
        ResumeSection(title: "Education", body: uiuc),
        ResumeSection(title: "Work Experience", body: [ctc, blackEdge]),
        ResumeSection(title: "Interests", body: interests)
    ]
)

let markdown = resume.renderMarkdown()
print(markdown)

//: # Output

//: ## Markdown
//NSBundle.mainBundle()
//try markdown.writeToFile("Resume.md", atomically: true, encoding: NSUTF8StringEncoding)
//
var markdownRenderer = Markdown()
let html = markdownRenderer.transform(resume.renderMarkdown())
let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 728, height: 1024))
webView.loadHTMLString(html, baseURL: nil)
XCPlaygroundPage.currentPage.liveView = webView

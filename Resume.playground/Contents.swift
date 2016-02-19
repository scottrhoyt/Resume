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
    notables: []
)

//: ## Work Experience

let ctc = WorkExperience(
    companyName: "Chicago Trading Company",
    title: "Senior Financial Engineer",
    startDate: { NSDateComponents(month: 7, year: 2006).date! }(),
    endDate: { NSDateComponents(month: 3, year: 2009).date! }(),
    notables: [
        "GPU",
        "Interest"
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
        ResumeSection(title: "Work Experience", body: [ctc]),
        ResumeSection(title: "Interests", body: interests)
    ]
)

let markdown = resume.renderMarkdown()

//: # Output

//: ## Markdown
NSBundle.mainBundle()
try markdown.writeToFile("Resume.md", atomically: true, encoding: NSUTF8StringEncoding)

var markdownRenderer = Markdown()
let html = markdownRenderer.transform(resume.renderMarkdown())
let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 728, height: 1024))
webView.loadHTMLString(html, baseURL: nil)
XCPlaygroundPage.currentPage.liveView = webView

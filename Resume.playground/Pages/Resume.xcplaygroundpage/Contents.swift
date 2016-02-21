import WebKit
import XCPlayground

//: ## Scott Hoyt

let bio = Bio(
    location: "Los Angeles, CA",
    email: "scottrhoyt@gmail.com",
    phoneNumber: "708.704.6804"
)

//: ### Education

let uiuc = Education(
    institution: "University of Illinois Urbana Champaign",
    major: "Computer Engineering",
    minor: "Business",
    graduationDate: { NSDateComponents(month: 6, year: 2006).date! }(),
    gpa: 3.92,
    highlights: [
        "Graduated with highest honors.",
        "Campus Honors Program",
        "Micron Scholar",
        "Dean's list all 8 semesters"
    ]
)

//: ### Work Experience

let ctc = WorkExperience(
    companyName: "Chicago Trading Company",
    title: "Senior Financial Engineer",
    startDate: { NSDateComponents(month: 7, year: 2006).date! }(),
    endDate: { NSDateComponents(month: 3, year: 2009).date! }(),
    highlights: [
        "Designed and developed GPGPU interest rate model for a new relative value trade. (Matlab, C, C#)",
        "Lead financial engineering for interest rate products."
    ]
)

let blackEdge = WorkExperience(
    companyName: "Black Edge Capital",
    title: "Cofounder",
    startDate: { NSDateComponents(month: 3, year: 2009).date! }(),
    endDate: { NSDateComponents(month: 3, year: 2011).date! }(),
    highlights: [
        "Designed and developed proprietary risk and trading software. (Matlab, C#)",
        "Grew company to 13 employees",
        "Best Year: $9M in profit. ~1800% Return on Capital."
    ]
)

let wildOnion = WorkExperience(
    companyName: "Wild Onion Labs",
    title: "Cofounder",
    startDate: { NSDateComponents(month: 11, year: 2013).date! }(),
    endDate: { NSDateComponents(month: 10, year: 2015).date! }(),
    highlights: [
        "Technical and strategic consulting for LA-based startups.",
        "Built Card & Ink, a self-serve kiosk for buying and customizing high quality greeting card from a curated list of Etsy artists. (Objective-C, C)"
    ]
)

let entrepreneurImpactDay = WorkExperience(
    companyName: "Entrepreneur Impact Day",
    title: "Cofounder",
    startDate: { NSDateComponents(month: 6, year: 2014).date! }(),
    endDate: NSDate.current(),
    highlights: [
        "Started an event-based non-profit for bringing together talented startups with good causes.",
        "Inaugural event connected 400 individuals from prominent LA startups and non-profits.",
        "11 teams completed day-long projects resulting in a variety of actionable deliverables accross design, marketing, and technology."
    ]
)

let diamondLabs = WorkExperience(
    companyName: "Diamond Labs",
    title: "Mobile Development Lead",
    startDate: { NSDateComponents(month: 10, year: 2015).date! }(),
    endDate: NSDate.current(),
    highlights: [
        "Digital Agency building products for startups and Fortune 500 companies.",
        "Lead mobile development as a whole and directly contribute to iOS projects. (Swift, Objective-C)"
    ]
)

//: ### Interests

let interests = [
    "Flying",
    "Sailing",
    "Hiking",
    "Guitar",
    "Rock Climbing",
    "Homebrewing",
    "Mountaineering"
]

//: ## Output

let resume = Resume(
    title: "Scott Hoyt",
    sections: [
        ResumeSection(body: bio),
        ResumeSection(title: "Education", body: uiuc),
        ResumeSection(
            title: "Work Experience",
            body: [ctc, blackEdge, wildOnion, entrepreneurImpactDay, diamondLabs]),
        ResumeSection(title: "Interests", body: interests)
    ]
)

let markdown = resume.renderMarkdown()
print(markdown)

// Display html rendering of markup by loading in a WKWebview and waiting to finish playground execution
// until `renderDelay` seconds after page finishes loading (to allow for rendering)
var markdownRenderer = Markdown()
let html = markdownRenderer.transform(markdown)

class PlaygroundStopper: NSObject, WKNavigationDelegate {
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        let renderDelay = 4.0
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(renderDelay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()) {
                XCPlaygroundPage.currentPage.finishExecution()
        }
    }
}

let stopper = PlaygroundStopper()
let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 728, height: 1600))
webView.navigationDelegate = stopper

XCPlaygroundPage.currentPage.liveView = webView
XCPlaygroundPage.currentPage.needsIndefiniteExecution

webView.loadHTMLString(html, baseURL: nil)

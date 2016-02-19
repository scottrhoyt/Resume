import Foundation

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

print(resume.renderMarkDown())


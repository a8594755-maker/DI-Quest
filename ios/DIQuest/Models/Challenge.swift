import Foundation

struct Challenge: Identifiable {
    let id: Int
    let name: String
    let type: ChallengeType
    let difficulty: Difficulty
    let question: String
    let scenario: Scenario?
    let options: [Option]?
    let correctAnswer: String?
    let hints: [String]
    let explanation: String
    let frameworkTip: String?
    var sampleSchema: String? = nil
    var starterCode: String? = nil
    var expectedQuery: String? = nil
    var evaluationCriteria: [String]? = nil
    var sampleAnswer: String? = nil

    struct Scenario {
        let title: String
        let narrative: String
        let data: [[String: String]]?
        let dataCaption: String?
    }

    struct Option: Identifiable {
        let id: String
        let text: String
        let explanation: String
    }

    enum ChallengeType: String {
        case multipleChoice = "multiple-choice"
        case openEnded = "open-ended"
        case code = "code"
    }

    enum Difficulty: String {
        case easy
        case medium
        case hard
    }
}

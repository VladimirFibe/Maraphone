import Foundation

struct Story: Decodable {
    let id: Int
    let title: String
    let choices: [String]
    let destinations: [Int]
    
    static func fetchStories() -> [Story] {
        if let url = Bundle.main.url(forResource: "Story",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let dataAsString = String(data: data, encoding: .utf8) ?? ""
                print("DEBUG: \(dataAsString)")
                let decoder = JSONDecoder()
                let questions = try decoder.decode([Story].self,
                                                   from: data)
                return questions
            } catch {
                print("error:\(error)")
            }
        }
        return stories
    }
    
    static var stories: [Story] = [
//        Story(
//            title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
//            choices: ["I'll hop in. Thanks for the help!", "Better ask him if he's a murderer first."],
//            destinations: [2, 1]
//        ),
//        Story(
//            title: "He nods slowly, unfazed by the question.",
//            choices: ["At least he's honest. I'll climb in.", "Wait, I know how to change a tire."],
//            destinations: [2, 3]
//        ),
//        Story(
//            title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
//            choices: ["I love Elton John! Hand him the cassette tape.", "It's him or me! You take the knife and stab him."],
//            destinations: [5, 4]
//        ),
//        Story(
//            title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
//            choices: ["The", "End"],
//            destinations: [0, 0]
//        ),
//        Story(
//            title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
//            choices: ["The", "End"],
//            destinations: [0, 0]
//        ),
//        Story(
//            title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
//            choices: ["The", "End"],
//            destinations: [0, 0]
//        )
    ]
}

import Foundation

struct Question: Decodable {
    let text: String
    let answer: Int
    
    static func fetch() -> [Question] {
        let defaultSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask?
        dataTask?.cancel()
        return questions()
    }
    static func questions() -> [Question] {
        
        if let url = Bundle.main.url(forResource: "Questions",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let questions = try decoder.decode([Question].self,
                                                  from: data)
                return questions
            } catch {
                print("error:\(error)")
            }
        }
        return defaultQuestions
    }
    
    static var defaultQuestions = [
        Question(text: "Four + Two is equal to Six", answer: 0),
        Question(text: "Five - Three is greater than One", answer: 0),
        Question(text: "Three + Eight is less than Ten", answer: 1)
    ]
}

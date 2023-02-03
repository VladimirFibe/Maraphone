import Foundation

struct Question: Decodable {
    let text: String
    var answers: [String]
    let answer: Int
    
    static func questions() -> [Question] {
        if let url = Bundle.main.url(forResource: "Questions",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let dataAsString = String(data: data, encoding: .utf8) ?? ""
                print("DEBUG: \(dataAsString)")
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
        Question(text: "A slug's blood is green.", answers: ["True", "False"], answer: 0),
        Question(text: "Approximately one quarter of human bones are in the feet.", answers: ["True", "False"], answer: 0),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answers: ["True", "False"], answer: 0),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answers: ["True", "False"], answer: 0),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answers: ["True", "False"], answer: 1),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answers: ["True", "False"], answer: 0),
        Question(text: "You can lead a cow down stairs but not up stairs.", answers: ["True", "False"], answer: 1),
        Question(text: "Google was originally called 'Backrub'.", answers: ["True", "False"], answer: 0),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answers: ["True", "False"], answer: 0),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answers: ["True", "False"], answer: 1),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answers: ["True", "False"], answer: 1),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answers: ["True", "False"], answer: 0)
    ]
}



extension URLSession {
  func fetchData(at url: URL, completion: @escaping (Result<[Question], Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let questions = try JSONDecoder().decode([Question].self, from: data)
          completion(.success(questions))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}



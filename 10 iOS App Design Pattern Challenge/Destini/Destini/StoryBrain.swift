import Foundation

struct StoryBrain {
    let stories = Story.fetchStories()
    var currentIndex = 0
    
    var currentTitle: String {
        stories[currentIndex].title
    }
    
    var currentChoices: [String] {
        stories[currentIndex].choices
    }
    
    mutating func nextStory(_ index: Int) {
        let destination = stories[currentIndex].destinations
        if index < destination.count {
            currentIndex = destination[index]
        } else {
            currentIndex = 0
        }
    }
}

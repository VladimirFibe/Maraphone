//
//  StoryBrain.swift
//  Destini
//
//  Created by Vladimir Fibe on 2/3/23.
//

import Foundation

struct StoryBrain {
    let stories = Story.stories
    var currentIndex = 0
    
    var currentTitle: String {
        stories[currentIndex].title
    }
    
    var currentChoices: [String] {
        [stories[currentIndex].choice1,
         stories[currentIndex].choice2]
    }
}

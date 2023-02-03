![App Brewery Banner](img/AppBreweryBanner.png)

#  Quizzler

## Our Goal

The goal of this tutorial is to take you one step further in your journey of becoming an app developer. We are going to introduce you to the holy grail of mobile design patterns: the Model View Controller (MVC) pattern. A design pattern is simply a repeatable and optimised solution to a common software problem and you’ll learn more about this when use in the tutorial.

## What you will create

You will program a trivia quiz app. If you have another field of expertise such as law or medicine, you’ll be glad to know that multiple choice question apps are one of the most popular types of educational apps on the App Store! 

## What you will learn

* How to programmatically change UI elements such as Labels and Buttons.
* What is a design pattern and how is it used in programming.
* How to use the Model-View-Controller or MVC pattern for app development.
* Learn about Swift Structures how to instantiate a struct instance.
* Understand the difference between value types and reference types. 
* Learn about Swift Classes and creating Objects.
* Compare Swift Classes with Swift Structs and know when to use which.
* Learn about Object Oriented Programming.
* How to refactor code and stay organised.



## Default Quiz

```
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
```

## Multiple Choice Quiz       
```
    func configure(with answers: [String]) {
        for index in answerButtons.indices {
            let button = answerButtons[index]
            if index < answers.count {
                button.setTitle(answers[index], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }
```


>This is a companion project to The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

![End Banner](img/readme-end-banner.png)

![](https://github.com/VladimirFibe/Maraphone/blob/main/09%20iOS%20App%20Design%20Patterns%20and%20Code%20Structuring/Quizzler/img/1.jpg)

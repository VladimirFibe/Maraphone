import Cocoa

func loveCalculator() {
    let loveScore = Int.random(in: 0..<101)
    print("loveScore = ", loveScore)
    if loveScore > 80 {
        print("You love each ather like Kanye loves Kanye.")
    } else if loveScore > 40 {
        print("You go together like Coke and Mentos")
    } else {
        print("You'll be forever alone")
    }
}

func loveSwitch() {
    let loveScore = Int.random(in: 0..<101)
    print("loveScore = ", loveScore)
    switch loveScore {
    case 81...: print("You love each ather like Kanye loves Kanye.")
    case 41...80: print("You go together like Coke and Mentos")
    case ...40: print("You'll be forever alone")
    default: print("Error")
    }
}

loveCalculator()
loveSwitch()

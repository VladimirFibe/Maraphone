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

loveCalculator()

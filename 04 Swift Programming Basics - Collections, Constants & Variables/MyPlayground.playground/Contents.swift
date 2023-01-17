import Cocoa

func exercise() {
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    alphabet.shuffled()[0..<6].joined ()

    let a  = alphabet
    let b = a.shuffled()
    let c = b[0..<6]
    let d = c.joined()
    let password = d
    print(password)
}

exercise()

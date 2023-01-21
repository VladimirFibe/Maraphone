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



//for a in "a"..."z" {
//    alphabet.append(a)
//}
//alphabet


let chars: [Character] = ["a", " ", "™"]
for ch in chars {
    print(ch, "-->", ch.asciiValue ?? 0)
}

var asciiVal3 = 65
let c = Character(UnicodeScalar(97))
let s = String(UnicodeScalar(UInt8(65)))
let ss = "\u{41}"

var alphabet: [String] = []
for i in 97...122 {
    alphabet.append(String(UnicodeScalar(UInt8(i))))
}
alphabet

import Foundation

let skeleton1 = Enemy(health: 100, attackStrength: 10)
let skeleton2 = skeleton1

skeleton1.takeDamage(amount: 10)
skeleton1.printInfo()
skeleton2.printInfo()

//
//print(skeleton.health)
//skeleton.move()
//skeleton.attack()

//let dragon = Dragon(health: 200, attackStrength: 15)
//dragon.wingSpan = 5
//dragon.attackStrength = 15
//dragon.talk(speech: "My teeth are swirds! My claws are spears! My wings are a hurricane!")
//dragon.move()
//dragon.attack()



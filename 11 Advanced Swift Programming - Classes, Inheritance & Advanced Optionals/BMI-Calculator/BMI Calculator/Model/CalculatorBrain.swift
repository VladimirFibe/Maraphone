import UIKit


struct CalculatorBrain {
    var bmi: BMI? = nil
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let (underWeigt, helthy, overWeight) = (#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        let value = weight / (height * height)
        if value < 18.5 {
            bmi = BMI(value: value, advice: "Eat more pies!", color: underWeigt)
        } else if value < 25 {
            bmi = BMI(value: value, advice: "Fit as a fiddle.", color: helthy)
        } else {
            bmi = BMI(value: value, advice: "Eat less pies!", color: overWeight)
        }
    }
    
    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0)
    }
    
    func getAdvice() -> String? {
        bmi?.advice
    }
    
    func getColor() -> UIColor? {
        bmi?.color
    }
}

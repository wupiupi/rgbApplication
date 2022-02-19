// Я захардкодил ширину лейбла, отображающего значение слайдера, ибо при изменении значений он расширяется и сужается :c

import UIKit

// Plan:
// 1. IBOutlets
// 2. Properties
// 3. Life Cycle
// 4. Methods
// 5. Action

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redSliderName: UILabel!
    @IBOutlet var greenSliderName: UILabel!
    @IBOutlet var blueSliderName: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderCounter: UILabel!
    @IBOutlet var greenSliderCounter: UILabel!
    @IBOutlet var blueSliderCounter: UILabel!
    
    
    // MARK: - Properties
    var redSliderValue: Float = 0
    var greenSliderValue: Float = 0
    var blueSliderValue: Float = 0
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Methods
    func setupUI() {
        
        rgbView.layer.cornerRadius = 15

        sliderNameDesign()
        sliderCounterDesign()
        sliderDesign()
    }
    
    func sliderNameDesign() {
        
        redSliderName.layer.masksToBounds = true
        greenSliderName.layer.masksToBounds = true
        blueSliderName.layer.masksToBounds = true
        
        redSliderName.layer.cornerRadius = 5
        greenSliderName.layer.cornerRadius = 5
        blueSliderName.layer.cornerRadius = 5
    }

    func sliderCounterDesign() {
        
        redSliderCounter.layer.masksToBounds = true
        greenSliderCounter.layer.masksToBounds = true
        blueSliderCounter.layer.masksToBounds = true
        
        redSliderCounter.layer.cornerRadius = 5
        greenSliderCounter.layer.cornerRadius = 5
        blueSliderCounter.layer.cornerRadius = 5
    }
    
    func sliderDesign() {
        
        redSlider.layer.cornerRadius = 15
        greenSlider.layer.cornerRadius = 15
        blueSlider.layer.cornerRadius = 15
    }
    
    func getColor(red: Float, green: Float, blue: Float) -> UIColor {
        return UIColor(red: CGFloat(red),
                       green: CGFloat(green),
                       blue: CGFloat(blue),
                       alpha: 1)
    }
    
    func roundValueByHundredths(value: Float) -> Float {
        let roundedValue = round(value * 100) / 100
        return roundedValue
    }
    
    
    // MARK: - Action
    @IBAction func redSliderAction() {
        
        redSliderValue = redSlider.value
        
        let redSliderRoundedValue = roundValueByHundredths(value: redSliderValue)
        redSliderCounter.text = String(redSliderRoundedValue)

        let redViewColor = getColor(red: redSliderValue,
                                     green: greenSliderValue,
                                     blue: blueSliderValue)

        rgbView.backgroundColor = redViewColor
    }
    
    @IBAction func greenSliderAction() {
        
        greenSliderValue = greenSlider.value
        
        let greenSliderValueRounded = roundValueByHundredths(value: greenSliderValue)
        greenSliderCounter.text = String(greenSliderValueRounded)
            
        let greenViewColor = getColor(red: redSliderValue,
                                       green: greenSliderValue,
                                       blue: blueSliderValue)
        
        rgbView.backgroundColor = greenViewColor
    }
    
    @IBAction func blueSliderAction() {
        
        blueSliderValue = blueSlider.value
        
        let blueSliderRoundedValue = roundValueByHundredths(value: blueSliderValue)
        blueSliderCounter.text = String(blueSliderRoundedValue)
            
        let blueViewColor = getColor(red: redSliderValue,
                                      green: greenSliderValue,
                                      blue: blueSliderRoundedValue)
        
        rgbView.backgroundColor = blueViewColor
    }
}

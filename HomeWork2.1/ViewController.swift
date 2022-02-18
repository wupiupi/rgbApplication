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
    
    
    // MARK: - Action
    @IBAction func redSliderAction() {
        
        let redSliderRoundedValue = round(redSlider.value * 100) / 100
        redSliderValue = redSlider.value
        
        let redViewColor = UIColor(red: CGFloat(redSliderValue),
                                   green: CGFloat(greenSliderValue),
                                   blue: CGFloat(blueSliderValue),
                                 alpha: 1)

        redSliderCounter.text = String(redSliderRoundedValue)
        rgbView.backgroundColor = redViewColor
    }
    
    @IBAction func greenSliderAction() {
        
        let greenSliderValueRounded = round(greenSlider.value * 100 ) / 100
        greenSliderCounter.text = String(greenSliderValueRounded)
        
        greenSliderValue = greenSlider.value
        
        let greenViewColor = UIColor(red: CGFloat(redSliderValue),
                                 green: CGFloat(greenSliderValue),
                                 blue: CGFloat(blueSliderValue),
                                 alpha: 1)
        
        rgbView.backgroundColor = greenViewColor
    }
    
    @IBAction func blueSliderAction() {
        
        let blueSliderRoundedValue = round(blueSlider.value * 100) / 100
        blueSliderCounter.text = String(blueSliderRoundedValue)
        
        blueSliderValue = blueSlider.value
        
        let blueViewColor = UIColor(red: CGFloat(redSliderValue),
                                   green: CGFloat(greenSliderValue),
                                    blue: CGFloat(blueSliderValue),
                                   alpha: 1)
        
        rgbView.backgroundColor = blueViewColor
    }
}

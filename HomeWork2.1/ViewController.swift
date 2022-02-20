import UIKit

/*
 Plan:
 1. IBOutlets
 2. Properties
 3. Life Cycle
 4. Methods
 5. Action
 */

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
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setColor()
        setValue(for: redSliderCounter, greenSliderCounter, blueSliderCounter)
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
    
    private func roundValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColor() {
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redSliderCounter.text = roundValue(from: redSlider)
            case 1: greenSliderCounter.text = roundValue(from: greenSlider)
            case 2: blueSliderCounter.text = roundValue(from: blueSlider)
            default: break
            }
        }
    }
    
    // MARK: - Action
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0: redSliderCounter.text = roundValue(from: sender)
        case 1: greenSliderCounter.text = roundValue(from: sender)
        case 2: blueSliderCounter.text = roundValue(from: sender)
        default: break
        }
        setColor()
    }
}

// Я захардкодил ширину лейбла, отображающего значение слайдера, ибо при изменении значений он расширяется и сужается :c

/*
 COLORREF C = RGB(r, g, b)
 r, g и b — интенсивность (в диапазоне от 0 до 255) соответственно красной, зелёной и синей составляющих определяемого цвета C. То есть ярко-синий цвет может быть определён как (0,0,255), красный как (255,0,0), ярко-фиолетовый — (255,0,255), чёрный — (0,0,0), а белый — (255,255,255) (wikipedia)
 */
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
    
    func addColor(_ color1: UIColor, with color2: UIColor) -> UIColor {
        var (redOne, greenOne, blueOne, alphaOne) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (redTwo, greenTwo, blueTwo, alphaTwo) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        color1.getRed(&redOne, green: &greenOne, blue: &blueOne, alpha: &alphaOne)
        color2.getRed(&redTwo, green: &greenTwo, blue: &blueTwo, alpha: &alphaTwo)

        // add the components, but don't let them go above 1.0
        return UIColor(red: min(redOne + redTwo, 1),
                       green: min(greenOne + greenTwo, 1),
                       blue: min(blueOne + blueTwo, 1),
                       alpha: (alphaOne + alphaTwo) / 2)
    }
    
    // MARK: - Action
    @IBAction func redSliderAction() {
        
        let redSliderRoundedValue = round(redSlider.value * 100) / 100
        let redViewColor = UIColor(red: CGFloat(redSlider.value),
                                 green: 0,
                                 blue: 0,
                                 alpha: 1)

        redSliderCounter.text = String(redSliderRoundedValue)
        rgbView.backgroundColor = redViewColor
    }
    
    @IBAction func greenSliderAction() {
        
        let greenSliderValueRounded = round(greenSlider.value * 100 ) / 100
        let greenViewColor = UIColor(red: 0,
                                 green: CGFloat(greenSlider.value),
                                 blue: 0,
                                 alpha: 1)
        
        greenSliderCounter.text = String(greenSliderValueRounded)
        rgbView.backgroundColor = greenViewColor
    }
    
    @IBAction func blueSliderAction() {
        
        let blueSliderRoundedValue = round(blueSlider.value * 100) / 100
        let blueViewColor = UIColor(red: 0,
                                   green: 0,
                                    blue: CGFloat(blueSlider.value),
                                   alpha: 1)
        
        blueSliderCounter.text = String(blueSliderRoundedValue)
        rgbView.backgroundColor = blueViewColor
    }
}

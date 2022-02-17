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
    
    // MARK: - Action
    @IBAction func redSliderAction() {
        let redSliderValue = redSlider.value
        let redSliderRoundedValue = round(redSliderValue * 100) / 100
        
        redSliderCounter.text = String(redSliderRoundedValue)
        rgbView.backgroundColor = redSlider.minimumTrackTintColor
    }
    
    @IBAction func greenSliderAction() {
        let greenSliderValue = greenSlider.value
        let greenSliderValueRounded = round(greenSliderValue * 100 ) / 100
        
        greenSliderCounter.text = String(greenSliderValueRounded)
        rgbView.backgroundColor = greenSlider.minimumTrackTintColor
    }
    
    @IBAction func blueSliderAction() {
        let blueSliderValue = blueSlider.value
        let blueSliderRoundedValue = round(blueSliderValue * 100) / 100
        
        blueSliderCounter.text = String(blueSliderRoundedValue)
        rgbView.backgroundColor = blueSlider.minimumTrackTintColor
    }
}

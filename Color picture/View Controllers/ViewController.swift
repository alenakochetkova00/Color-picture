
import UIKit

protocol FullScreenScreen: AnyObject {
    func setColor(color: UIColor)
}

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    weak var delegate: FullScreenScreen?

    @IBOutlet var colorPictures: UIView!
    
    @IBOutlet var fullScreenText: UILabel!
    @IBOutlet var fullScreenButton: UIButton!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextMeaning: UILabel!
    @IBOutlet var greenTextMeaning: UILabel!
    @IBOutlet var blueTextMeaning: UILabel!
    
    @IBOutlet var enteringNumber: UITextField!
    @IBOutlet var enteringNumberTwo: UITextField!
    @IBOutlet var enteringNumberThree: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButtonOnKeyboard()
        
        // MARK: Rounding shape
        colorPictures.layer.cornerRadius = 10
        
        // MARK: Initial Values Sliders
        
        redTextMeaning.text = String(Int(redSlider.value))
        greenTextMeaning.text = String(Int(greenSlider.value))
        blueTextMeaning.text = String(Int(blueSlider.value))
        
        enteringNumber.placeholder = redTextMeaning.text
        enteringNumberTwo.placeholder = greenTextMeaning.text
        enteringNumberThree.placeholder = blueTextMeaning.text
        
        
        // MARK: Color Slider
        redSlider.tintColor = UIColor.black
        greenSlider.tintColor = UIColor.black
        blueSlider.tintColor = UIColor.black
        
        // MARK: Font Text
        redLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        greenLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        blueLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        
        redTextMeaning.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        greenTextMeaning.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        blueTextMeaning.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        
        fullScreenText.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        
    }
    
    
    // MARK: Values ​​when the slider moves
    @IBAction func rgbSlider(_ sender: Any) {

        redTextMeaning.text = String(Int(redSlider.value))
        greenTextMeaning.text = String(Int(greenSlider.value))
        blueTextMeaning.text = String(Int(blueSlider.value))

        enteringNumber.placeholder = redTextMeaning.text
        enteringNumberTwo.placeholder = greenTextMeaning.text
        enteringNumberThree.placeholder = blueTextMeaning.text
        
        setColor()
    }
    

    // MARK: Values, when added to the white boxes on the right
    private func newValues() {
        
        redTextMeaning.text = String(Int(redSlider.value))
        greenTextMeaning.text = String(Int(greenSlider.value))
        blueTextMeaning.text = String(Int(blueSlider.value))

        enteringNumber.placeholder = redTextMeaning.text
        enteringNumberTwo.placeholder = greenTextMeaning.text
        enteringNumberThree.placeholder = blueTextMeaning.text
        
        redSlider.setValue((Float(enteringNumber.text!) ?? redSlider.value), animated: true)
        greenSlider.setValue((Float(enteringNumberTwo.text!) ?? greenSlider.value), animated: true)
        blueSlider.setValue((Float(enteringNumberThree.text!) ?? blueSlider.value), animated: true)
        
        setColor()
    }
    
    
    // MARK: Сolor View
    func setColor() {
            colorPictures.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                                    green: CGFloat(greenSlider.value) / 255.0,
                                                    blue: CGFloat(blueSlider.value) / 255.0,
                                                    alpha: 1)
        }
    
    
    // MARK: Button "OK" in keyboard
    func addDoneButtonOnKeyboard() {
        
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            enteringNumber.inputAccessoryView = doneToolbar
            enteringNumberTwo.inputAccessoryView = doneToolbar
            enteringNumberThree.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            enteringNumber.resignFirstResponder()
            newValues()
            alert()
            
            enteringNumberTwo.resignFirstResponder()
            newValues()
            alert()
            
            enteringNumberThree.resignFirstResponder()
            newValues()
            alert()
        }
    
    
    // MARK: Adding an error popup message
    func alert() {
        if Int(enteringNumber.text!) ?? 0 < 0 || Int(enteringNumber.text!) ?? 0 > 225 {
            let alert = UIAlertController(title: "error...", message: "incorrect value", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }  else if Int(enteringNumberTwo.text!) ?? 0 < 0 || Int(enteringNumberTwo.text!) ?? 0 > 225 {
            let alert = UIAlertController(title: "error...", message: "incorrect value", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }  else if Int(enteringNumberThree.text!) ?? 0 < 0 || Int(enteringNumberThree.text!) ?? 0 > 225 {
            let alert = UIAlertController(title: "error...", message: "incorrect value", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: Delegate
    @IBAction func fullScreenButtonClick(_ sender: Any) {
        delegate?.setColor(color: colorPictures.backgroundColor!)
        dismiss(animated: true)
    }
}





import UIKit

class FullScreenMode: UIViewController {

    @IBOutlet var textButtonFirstScreen: UILabel!
    
    override func viewDidLoad() {
        textButtonFirstScreen.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.delegate = self
    }
}

// MARK: Delegate
extension FullScreenMode: FullScreenScreen {
    func setColor(color: UIColor) {
        print(color)
        view.backgroundColor = color
    }
}

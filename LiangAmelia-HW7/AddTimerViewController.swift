// Project: LiangAmelia-HW7
// EID: dl29927
// Course: CS329E

import UIKit

class AddTimerViewController: UIViewController {

    @IBOutlet weak var eventLabel: UILabel!
    
    @IBOutlet weak var eventTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var delegate : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: Any) {
        let timeInput = timeTextField.text!
        let timeValue = Int(timeInput)!
        let eventText = eventTextField.text!
        let locationText = locationTextField.text!
        
        let eachTimer = Timer(event: eventText, location: locationText, time: timeValue)
        
        let otherVC = delegate as! AppendTimer
        if (eventText != "" && locationText != "" && timeInput != "") {
            otherVC.addTimer(timer: eachTimer)
        }
        
    }
}

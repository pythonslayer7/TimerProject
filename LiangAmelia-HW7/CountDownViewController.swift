// Project: LiangAmelia-HW7
// EID: dl29927
// Course: CS329E

import UIKit
import Foundation

class CountDownViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currEventLabel: UILabel!
    @IBOutlet weak var currLocationLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!

    var delegate : UIViewController!
    var timeInt : Int = 0
    
    var timeText = Int()
    var eventText = String()
    var locationText = String()
    var timer: Timer?
    var isCountingDown = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func decrement(time: Timer) {
        let queue = DispatchQueue(label: "thisQueue", qos: .utility )
        queue.async {
            while (self.isCountingDown && self.timeInt != 0) {
                sleep(1)
                self.timeInt -= 1
                DispatchQueue.main.async {
                    self.timer?.time = self.timeInt
                    self.countDownLabel.text = "" + String(self.timeInt)
                }
            }
            if (self.timeInt == 0) {
                self.timer?.time = 0
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timeInt = timeText
        currEventLabel.text = eventText
        currLocationLabel.text = locationText
        countDownLabel.text = "\(timeInt)"
        decrement(time: Timer(event: eventText, location: locationText, time: timeText))
        isCountingDown = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isCountingDown = false
        countDownLabel.text = "" + String(self.timeInt)
    }
}



// Project: LiangAmelia-HW7
// EID: dl29927
// Course: CS329E

import UIKit

var timerList:[Timer] = []

protocol AppendTimer {
    func addTimer(timer: Timer)
}
protocol ReloadData {
    func reload(table: UITableView)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AppendTimer, ReloadData{
    
    func reload(table: UITableView) {
        tableView.reloadData()
    }
    
    func reloadData(table: UITableView) {
        tableView.reloadData()
    }
    
    func addTimer(timer: Timer) {
        timerList.append(timer)
        tableView.reloadData()
    }
    
    let segueIdentifier = "segueIdentifier"
    let cellIdentifier = "TimerTable-ViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let row = indexPath.row

        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.text = timerList[row].description
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier,
           let destination = segue.destination as? AddTimerViewController {
            destination.delegate = self
        } else if segue.identifier == "secondSegue", let destination = segue.destination as? CountDownViewController, let timerIndex = tableView.indexPathForSelectedRow?.row {
            destination.delegate = self
            destination.timeText = timerList[timerIndex].time
            destination.eventText = timerList[timerIndex].event
            destination.locationText = timerList[timerIndex].location
            destination.timer = timerList[timerIndex]
       }
    }
}


// Project: LiangAmelia-HW7
// EID: dl29927
// Course: CS329E

import Foundation
class Timer: CustomStringConvertible {

    var event: String
    var location: String
    var time: Int

    init(event: String, location: String, time: Int) {
        self.event = event
        self.location = location
        self.time = time
    }
    
    var description: String {
        return "Event  " + event + " \n" + "                                 Remaining Time(s)  " + String(time) + "\nLocation  " + location
    }
}

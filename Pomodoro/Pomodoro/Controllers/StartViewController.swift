//
//  ViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/23/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var currentPomodoroSet: PomodoroSet?
    var listOfPomodoros: [Pomodoro] = []
    var listOfPomodoroSets: [PomodoroSet] = []
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var breakTimerLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // Appends a 0 if less than 10
        if Int(SettingsConfig.TimerLengthInSeconds) < 10 {
            timerLabel.text = "0\(Int(SettingsConfig.TimerLengthInSeconds) / 3600)"
        } else {
            timerLabel.text = String(Int(SettingsConfig.TimerLengthInSeconds) / 3600)
        }
        if Int(SettingsConfig.BreakLengthInSeconds) < 10 {
            breakTimerLabel.text = "0\((Int(SettingsConfig.BreakLengthInSeconds) % 3600) / 60)"
        } else {
            breakTimerLabel.text = String((Int(SettingsConfig.BreakLengthInSeconds) % 3600) / 60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavigationController = segue.destination as? PomodoroViewController {
            // Create a new Pomodoro instance
            let newPomodoro = Pomodoro()
            if currentPomodoroSet == nil {
                currentPomodoroSet = PomodoroSet()
                listOfPomodoroSets.append(currentPomodoroSet!)
            }
            
            currentPomodoroSet?.pomodoros.append(newPomodoro)
            listOfPomodoros.append(newPomodoro)
            
            destinationNavigationController.currentPomodoroInstance = newPomodoro
        }
    }
    
}


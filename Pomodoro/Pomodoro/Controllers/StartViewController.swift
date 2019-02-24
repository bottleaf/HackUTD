//
//  ViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/23/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var tabBarVC: TabBarViewController?
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var breakTimerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //makes button rounded
        startButton.layer.cornerRadius = 10;
        startButton.clipsToBounds = true;
        
        // Appends a 0 if less than 10
        if Int(SettingsConfig.TimerLengthInSeconds) / 60 < 10 {
            timerLabel.text = "0\(Int(SettingsConfig.TimerLengthInSeconds / 60))"
        } else {
            timerLabel.text = String(Int(SettingsConfig.TimerLengthInSeconds / 60))
        }
        if Int(SettingsConfig.BreakLengthInSeconds) / 60 < 10 {
            breakTimerLabel.text = "0\(Int(SettingsConfig.BreakLengthInSeconds / 60))"
        } else {
            breakTimerLabel.text = String(Int(SettingsConfig.BreakLengthInSeconds / 60))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarVC = (self.tabBarController as? TabBarViewController)!
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavigationController = segue.destination as? PomodoroViewController {
            // Create a new Pomodoro instance
            let newPomodoro = Pomodoro()
            if tabBarVC!.currentPomodoroSet == nil {
                tabBarVC!.currentPomodoroSet = PomodoroSet()
                tabBarVC!.listOfPomodoroSets.append(tabBarVC!.currentPomodoroSet!)
            }
            
            tabBarVC!.currentPomodoroSet?.pomodoros.append(newPomodoro)
            tabBarVC!.listOfPomodoros.append(newPomodoro)
            
            destinationNavigationController.currentPomodoroInstance = newPomodoro
        }
    }
    
}


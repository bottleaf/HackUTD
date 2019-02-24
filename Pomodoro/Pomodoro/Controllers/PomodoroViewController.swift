//
//  PomodoroViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/23/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class PomodoroViewController: UIViewController {
    
    var currentPomodoroInstance: Pomodoro!
    var timer: Timer?
    var timer2: Timer? //added 2nd timer
    
    @IBOutlet weak var giveUpButton: UIButton!
    @IBOutlet weak var distractionButton: UIButton!
    @IBOutlet weak var endBreakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    // Starts timer with the passed in Pomodoro timer length
    func startTimer() {
        guard let currentPomodoro = currentPomodoroInstance else { fatalError("currentPomodoroInstance is nil") }
        timer = Timer.scheduledTimer(timeInterval: currentPomodoro.time + currentPomodoro.breakTime, target: self, //added break time to total timer time
            selector: #selector(performTimerEndAction), userInfo: nil, repeats: false)
        
        timer2 = Timer.scheduledTimer(timeInterval: currentPomodoro.time, target: self, selector: #selector(performTimer2EndAction), userInfo: nil, repeats: false) //set up 2nd timer
    }
    
    // Dismisses the view
    @objc func performTimerEndAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func performTimer2EndAction() { //this is the action that changes the appearence of pomdoro view
        // Stop all the timers
        timer?.invalidate()
        timer2?.invalidate()
        
        distractionButton.isEnabled = false
        giveUpButton.isEnabled = false
        giveUpButton.isHidden = true
        endBreakButton.isEnabled = true
        endBreakButton.isHidden = false
        
        Alert.showSuccessfulPomodoroAlert(on: self, popViewControllerOnCompletion: true)
    }
    
    // Returns the current timer's time
    func getCurrentTimerTimeInterval() -> TimeInterval? {
        return timer2?.fireDate.timeIntervalSince(Date())
    }
    
    // Logs the time the user failed, and dismisses the view
    @IBAction func giveUpButtonActions(_ sender: UIButton) {
        guard let currentPomodoro = currentPomodoroInstance else { fatalError("currentPomodoroInstance is nil") }
        currentPomodoro.failedAtTime = getCurrentTimerTimeInterval()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func endBreakButtonActions(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Adds a timestamp for the distraction
    @IBAction func distractionButtonActions(_ sender: UIButton) {
        guard let currentPomodoro = currentPomodoroInstance else { fatalError("currentPomodoroInstance is nil") }
        
        if let currentTime = getCurrentTimerTimeInterval() {
            currentPomodoro.listOfDistractionTimes.append(currentTime)
        }
    }
    
}

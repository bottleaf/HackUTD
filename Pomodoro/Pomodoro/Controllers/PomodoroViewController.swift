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
    
    @IBOutlet weak var giveUpButton: UIButton!
    @IBOutlet weak var distractionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }
    
    // Starts timer with the passed in Pomodoro timer length
    func startTimer() {
        guard let currentPomodoro = currentPomodoroInstance else { fatalError("currentPomodoroInstance is nil") }
        timer = Timer.scheduledTimer(timeInterval: currentPomodoro.time, target: self, selector: #selector(performTimerEndAction), userInfo: nil, repeats: false)
    }
    
    // Dismisses the view
    @objc func performTimerEndAction() {
        dismiss(animated: true, completion: nil)
    }
    
    // Returns the current timer's time
    func getCurrentTimerTimeInterval() -> TimeInterval? {
        return timer?.fireDate.timeIntervalSince(Date())
    }
    
    // Logs the time the user failed, and dismisses the view
    @IBAction func giveUpButtonActions(_ sender: UIButton) {
        guard let currentPomodoro = currentPomodoroInstance else { fatalError("currentPomodoroInstance is nil") }
        currentPomodoro.failedAtTime = getCurrentTimerTimeInterval()
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

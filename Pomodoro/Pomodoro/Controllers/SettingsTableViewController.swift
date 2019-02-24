//
//  SettingsTableViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/23/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var timerPicker: UIDatePicker?
    var breakTimerPicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - UIDatePicker Actions
    
    @objc func timerPickerOnChanged(picker: UIDatePicker) {
        SettingsConfig.TimerLengthInSeconds = TimeInterval((timerPicker?.countDownDuration)!)
    }
    
    @objc func breakTimerPickerOnChanged(picker: UIDatePicker) {
        SettingsConfig.BreakLengthInSeconds = TimeInterval((breakTimerPicker?.countDownDuration)!)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? PickerTableViewCell else { fatalError("Could not downcast to PickerTableViewCell") }
            
            cell.title.text = "Timer Length"
            timerPicker = cell.picker
            
            let currentTimeInterval: Int = Int(SettingsConfig.TimerLengthInSeconds) * 60
            let calendar = Calendar(identifier: .gregorian)
            let date = DateComponents(calendar: calendar, hour: currentTimeInterval / 3600, minute: (currentTimeInterval % 3600) / 60).date!
            timerPicker?.setDate(date, animated: true)
            
            // Add target to timerPicker
            timerPicker?.addTarget(self, action: #selector(timerPickerOnChanged(picker:)), for: .valueChanged)
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? PickerTableViewCell else { fatalError("Could not downcast to PickerTableViewCell") }
            
            cell.title.text = "Break Length"
            breakTimerPicker = cell.picker
            
            let currentTimeInterval: Int = Int(SettingsConfig.BreakLengthInSeconds) * 60
            let calendar = Calendar(identifier: .gregorian)
            let date = DateComponents(calendar: calendar, hour: currentTimeInterval / 3600, minute: (currentTimeInterval % 3600) / 60).date!
            breakTimerPicker?.setDate(date, animated: true)
            
            // Add target to timerPicker
            breakTimerPicker?.addTarget(self, action: #selector(breakTimerPickerOnChanged(picker:)), for: .valueChanged)
            
            return cell
        default:
            fatalError("Could not dequeue cell")
        }
    }

}

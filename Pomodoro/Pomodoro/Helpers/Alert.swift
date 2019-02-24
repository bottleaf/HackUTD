//
//  Alert.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/24/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

struct Alert {
    static func showSuccessfulPomodoroAlert(on viewController: UIViewController, popViewControllerOnCompletion: Bool? = false) {
        let alert = UIAlertController(title: "Great Job!", message: "You successfully completed your \(SettingsConfig.TimerLengthInSeconds) pomodoro!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Thanks!", style: .default) {
            UIAlertAction in
            if let pop = popViewControllerOnCompletion, pop {
                alert.dismiss(animated: true, completion: nil)
                viewController.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}

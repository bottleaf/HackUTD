//
//  TabBarViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/24/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var currentPomodoroSet: PomodoroSet?
    var listOfPomodoros: [Pomodoro] = []
    var listOfPomodoroSets: [PomodoroSet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

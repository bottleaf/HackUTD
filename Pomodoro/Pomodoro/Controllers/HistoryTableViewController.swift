//
//  HistoryTableViewController.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/24/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    var tabBarVC: TabBarViewController?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarVC = (self.tabBarController as? TabBarViewController)!
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tabBarVC!.listOfPomodoros.count)
        return tabBarVC!.listOfPomodoros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        cell.textLabel?.text = "\(dateFormatter.string(from: tabBarVC!.listOfPomodoros[indexPath.row].executedOnDate))"
        cell.detailTextLabel?.text = "Number of Distractions: \(tabBarVC!.listOfPomodoros[indexPath.row].listOfDistractionTimes.count)"
        
        return cell
    }
    
}

//
//  TableViewController.swift
//  Reminder
//
//  Created by Arii on 2024-03-07.
//

import UIKit

var list = reminders()


class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        list.sortDataCollectionByDate()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.dataCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "remindersList", for: indexPath) as! TableViewCell
        cell.titleLabel.text = list.dataCollection[indexPath.row].title
        cell.dateLabel.text = list.dataCollection[indexPath.row].date
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editAddVC = storyboard?.instantiateViewController(withIdentifier: "editAddList") as! editAddList
        navigationController?.pushViewController(editAddVC, animated: true)
        editAddVC.index = indexPath.row
    }

    
    @IBAction func addReminderButtonClicked(_ sender: Any) {
        let editAddVC = storyboard?.instantiateViewController(withIdentifier: "editAddList") as! editAddList
        navigationController?.pushViewController(editAddVC, animated: true)
    }
    
    @IBAction func unwindSeguetoList(segue: UIStoryboardSegue){}
}

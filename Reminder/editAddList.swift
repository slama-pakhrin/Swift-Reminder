//
//  editAddList.swift
//  Reminder
//
//  Created by Arii on 2024-03-07.
//

import UIKit

class editAddList: UITableViewController {

    @IBOutlet weak var dateInputField: UIDatePicker!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var index: Int?
    var newTitle: String?
    var newDescription: String?
    var newDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(index != nil){
            editMode()
        }
        //this below code is suppose to make changes in the visibility of Save button
//        let checkTitleChange = titleField.text?.isEmpty
//        let checkDescChange = descriptionField.text?.isEmpty
//        if(checkTitleChange == true && checkDescChange == true){
//            saveButton.isEnabled = false
//        }
//        else if(checkTitleChange == false && checkDescChange == false){
//            saveButton.isEnabled = true
//        }
    }
    
    func editMode(){
        titleField.text = list.dataCollection[index!].title
        descriptionField.text = list.dataCollection[index!].description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM d hh:mm a"
        if let date = dateFormatter.date(from: list.dataCollection[index!].date) {
                dateInputField.setDate(date, animated: true)
                }
        }
    
    func editReminder(){
        list.dataCollection[index!].title = titleField.text!
        list.dataCollection[index!].description = descriptionField.text!
        list.dataCollection[index!].date = formatDate()
    }

    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM d hh:mm a"
        let date = dateFormatter.string(from: dateInputField.date)
        return date
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if(index == nil){
            newTitle = titleField.text
            newDescription = descriptionField.text
            newDate = formatDate()
            let newObject = dataModule(title: newTitle!, description: newDescription!, date: newDate!)
            print(newObject)
            list.dataCollection.append(newObject)
            print(list.dataCollection)
        }
        else if(index != nil){
            editReminder()
        }
    }
}

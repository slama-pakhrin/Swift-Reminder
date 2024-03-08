//
//  dataModule.swift
//  Reminder
//
//  Created by Arii on 2024-03-07.
//

import UIKit

class dataModule{
    var title: String
    var description: String
    var date: String
    init(title: String, description: String, date: String) {
        self.title = title
        self.description = description
        self.date = date
    }
}

class reminders{
    var dataCollection: [dataModule] = [dataModule(title: "MidTerm", description: "3 hours to go", date: "Thu Mar 7 5:05 pm")]
    
    func sortDataCollectionByDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d h:mm a"
        dataCollection.sort { (data1, data2) -> Bool in
            if let date1 = dateFormatter.date(from: data1.date), let date2 = dateFormatter.date(from: data2.date) {
                   return date1 < date2
               }
               return false
           }
       }
}

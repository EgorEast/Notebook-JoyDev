//
//  AddEventViewModel.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

import Foundation

enum Sex {
    case man
    case woman
}

protocol AddEventViewModel {
    var name: String { get set }
    var date: NSDate { get set }
    var age: Int { get set }
}

final class AddEventViewModelImpl: AddEventViewModel {
    var name = ""
    var date: NSDate = NSDate()
    var age: Int = 0
    var sex: Sex?
    var instagram: String?
    
    init() {
    }
    
    private func setData(data: String = "2016-02-29 12:24:26") {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        if let date = dateFormatter.date(from: data) as NSDate? {
            self.date = date
            print(date)
        }
        
        //                  Formats:
        // Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
        // 09/12/2018                        --> MM/dd/yyyy
        // 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
        // Sep 12, 2:11 PM                   --> MMM d, h:mm a
        // September 2018                    --> MMMM yyyy
        // Sep 12, 2018                      --> MMM d, yyyy
        // Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
        // 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
        // 12.09.18                          --> dd.MM.yy
        // 10:41:02.112                      --> HH:mm:ss.SSS
    }
}

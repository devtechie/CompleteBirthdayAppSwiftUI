///**
/**

BirthdayAppDemo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 6/25/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

class AddNewBirthdayViewModel {
    
    var titleText: String = "Add New Birthday!"
    
    func saveBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.saveBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}

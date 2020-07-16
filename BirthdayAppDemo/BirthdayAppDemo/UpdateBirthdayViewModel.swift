///**
/**

BirthdayAppDemo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 6/26/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

class UpdateBirthdayViewModel {
    func updateBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.updateBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}

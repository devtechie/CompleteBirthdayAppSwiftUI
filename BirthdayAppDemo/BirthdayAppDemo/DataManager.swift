///**
/**

BirthdayAppDemo
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 6/22/20
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    // get records
    func getBirthdays() -> [Birthday] {
        var birthdays = [Birthday]()
        let bdRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        
        do {
            birthdays = try self.managedContext.fetch(bdRequest)
        } catch {
            print(error)
        }
        
        return birthdays
    }
    
    // save birthday
    func saveBirthday(id: UUID, name: String, date: Date) {
        let b = Birthday(context: self.managedContext)
        b.date = date
        b.name = name
        b.id = id
        do {
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // remove birthday
    func removeBirthday(id: UUID) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let bdays = try self.managedContext.fetch(fetchRequest)
            for bday in bdays {
                self.managedContext.delete(bday)
            }
            try self.managedContext.save()
        } catch {
          print(error)
        }
    }
    
    // update birthday
    func updateBirthday(id: UUID, name: String, date: Date) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let bday = try self.managedContext.fetch(fetchRequest).first
            bday?.date = date
            bday?.name = name
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
}

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

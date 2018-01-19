//
//  CoreDataHandler.swift
//  Helloquent
//
//  Created by Morgan Trudeau on 2018-01-18.
//  Copyright © 2018 Morgan Trudeau. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol FetchRoomCoreData: class {
    func coreRoomDataReceived(savedRoomIDs: [String])
}

class CoreDataHandler {
    
    private static let m_instance = CoreDataHandler()
    
    static var Instance: CoreDataHandler {
        return m_instance
    }
    
    weak var delegate: FetchRoomCoreData?
    
    private var m_roomIDs = [String]()
    
    func saveRoomCoreData(currentRoomID: String) {
        
        if !m_roomIDs.contains(currentRoomID) {
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            
            let managedContext =
                appDelegate.persistentContainer.viewContext
            
            let entity =
                NSEntityDescription.entity(forEntityName: "RoomData",
                                           in: managedContext)!
            
            let room = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
            
            room.setValue(currentRoomID, forKeyPath: "id")
            
            do {
                try managedContext.save()
            } catch {
                print("save error")
            }
        }
    }
    
    func deleteRoomCoreData(currentRoomID: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "RoomData")
        
        do{
            let rooms = try managedContext.fetch(fetchRequest)
            if let indexToDelete = rooms.index(where: { $0.value(forKey: "id") as! String == currentRoomID }) {
                managedContext.delete(rooms[indexToDelete])
            }
        } catch {
            print("delete error")
        }

    }
    
    func fetchRoomCoreData() {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "RoomData")
        
        do {
            let coreData = try managedContext.fetch(fetchRequest)
            m_roomIDs.removeAll()
            for room in coreData {
                m_roomIDs.append(room.value(forKey: "id") as! String)
            }
            self.delegate?.coreRoomDataReceived(savedRoomIDs: m_roomIDs)
            
        } catch {
            print("fetch error")
        }
    }
    
    func isCurrentRoomSaved(currentRoomID: String) -> Bool {
        let isSaved = m_roomIDs.contains(where: { $0 == currentRoomID })
        return isSaved
    }
    
    
    
}

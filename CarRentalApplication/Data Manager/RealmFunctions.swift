//
//  RealmFunctions.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//


import Foundation
import RealmSwift

class RealmFunctions {
    let realm = try! Realm()
    func getFilePath() {
        if let url = realm.configuration.fileURL {
            print(url)
        }
    }
}


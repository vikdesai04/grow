//
//  FirebaseHelper.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/12/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import Foundation
import FirebaseFirestore

private var helper = FirebaseHelper()

class FirebaseHelper {
    static var shared: FirebaseHelper = helper
    private let db: Firestore = Firestore.firestore()
    
    func validatePlantCode(plantCode: String, completionHandler: @escaping (Bool) -> Void) {
        getDropsForPlant(plantCode: plantCode) { (drops) in
            completionHandler(drops != nil)
        }
    }
    
    func getDropsForPlant(plantCode: String, completionHandler: @escaping (Int?) -> Void) {
        db.collection("plants").document(plantCode).getDocument { (snap, err) in
            guard err == nil else {
                completionHandler(nil)
                return
            }
            completionHandler(snap?.data()?["drops"] as? Int)
        }
    }
    
    func setDropsForPlant(plantCode: String, drops: Int, completionHandler: @escaping (Bool) -> Void) {
        db.collection("plants").document(plantCode).updateData([
            "drops": drops
        ]) { err in
            completionHandler(err == nil)
        }
    }
}

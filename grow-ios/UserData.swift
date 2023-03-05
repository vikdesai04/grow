//
//  UserData.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/12/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    
    var plantCode: String? {
        didSet {
            UserDefaults.standard.set(plantCode, forKey: "\(UserData.userDefaultsPrefix)-plant-code")
        }
    }
    @Published var drops: Int? {
        didSet {
            if let plantCode = plantCode, let drops = drops {
                FirebaseHelper.shared.setDropsForPlant(plantCode: plantCode, drops: drops) { _ in
                    // TODO: handle failure
                }
            }
        }
    }
    @Published var name: String? {
        didSet {
            UserDefaults.standard.set(name, forKey: "\(UserData.userDefaultsPrefix)-name")
        }
    }
    
    private static var userDefaultsPrefix = "grow-ios-v1"
    
    init(drops: Int?) {
        name = UserDefaults.standard.string(forKey: "\(UserData.userDefaultsPrefix)-name")
        plantCode = UserDefaults.standard.string(forKey: "\(UserData.userDefaultsPrefix)-plant-code")
        self.drops = drops
    }
    
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.string(forKey: "\(userDefaultsPrefix)-name") != nil &&
                UserDefaults.standard.string(forKey: "\(userDefaultsPrefix)-plant-code") != nil
    }
    
    static func login(name: String, plantCode: String, completionHandler: @escaping (UserData?) -> Void) {
        FirebaseHelper.shared.validatePlantCode(plantCode: plantCode) { (valid) in
            guard valid else {
                completionHandler(nil)
                return
            }
            UserDefaults.standard.set(plantCode, forKey: "\(UserData.userDefaultsPrefix)-plant-code")
            UserDefaults.standard.set(name, forKey: "\(UserData.userDefaultsPrefix)-name")
            dataForLoggedInUser(completionHandler: completionHandler)
        }
    }
    
    static func dataForLoggedInUser(completionHandler: @escaping (UserData?) -> Void) {
        guard isLoggedIn() else {
            completionHandler(nil)
            return
        }
        let plantCode = UserDefaults.standard.string(forKey: "\(UserData.userDefaultsPrefix)-plant-code")!
        FirebaseHelper.shared.getDropsForPlant(plantCode: plantCode) { (drops) in
            if let drops = drops {
                completionHandler(UserData(drops: drops))
            } else {
                completionHandler(nil)
            }
        }
    }
}

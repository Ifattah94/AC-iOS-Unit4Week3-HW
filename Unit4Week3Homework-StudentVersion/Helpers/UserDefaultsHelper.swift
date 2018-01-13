//
//  UserDefaultsHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/13/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
class UserDefaultsHelper {
    
  
    private init() {}
    static let manager = UserDefaultsHelper()
    
    private let defaults = UserDefaults.standard
    
    private let key = "userDefaults"
    
    
    struct MyDefaults: Codable {
        let zipCode: Int
        let tracker: Int
    }
    
    
   
    func createDefaultSetting(value: MyDefaults) {
        do {
            let data = try PropertyListEncoder().encode(value)
            defaults.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
  
    func getValue() -> MyDefaults? {
        guard let data = defaults.data(forKey: "userDefaults") else { return nil }
        do {
            let myDefaults = try PropertyListDecoder().decode(MyDefaults.self, from: data)
            return myDefaults
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}

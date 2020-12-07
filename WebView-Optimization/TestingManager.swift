//
//  TestingManager.swift
//  WebView-Optimization
//
//  Created by Maxence de Cussac on 07/12/2020.
//

import Foundation


class TestingManager {
    
    static let sharedTestingManager = TestingManager(string: "")

    // MARK: - Properties
    let buttonlogin: String
    
    // MARK: - Initialization
    init(string: String) {
        self.buttonlogin = string
    }
    
    // MARK: - Accessors
    class func shared() -> TestingManager {
        return sharedTestingManager
    }
}

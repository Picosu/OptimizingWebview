//
//  LoginUITests.swift
//  WebView-OptimizationUITests
//
//  Created by Maxence de Cussac on 07/12/2020.
//

import XCTest

class LoginUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
//        let ressourcesStaticText = XCUIApplication().webViews.webViews.webViews/*@START_MENU_TOKEN@*/.staticTexts["Ressources"]/*[[".otherElements[\"Volans OGame\"]",".links[\"Ressources\"].staticTexts[\"Ressources\"]",".staticTexts[\"Ressources\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        ressourcesStaticText/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        ressourcesStaticText.tap()
//        ressourcesStaticText.tap()
        
        let webViewsQuery = XCUIApplication().webViews.webViews.webViews
        webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Jouer"]/*[[".otherElements[\"OGame : le jeu par navigateur le plus populaire de l'univers !\"]",".links[\"Jouer\"].buttons[\"Jouer\"]",".buttons[\"Jouer\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        let ogameFrame = webViewsQuery.element
        
        
        XCUIApplication().webViews.webViews.webViews.buttons[""].tap()
        
        //webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Dernière partie Octans – Joueurs en ligne : 115"]/*[[".otherElements[\"OGame : le jeu par navigateur le plus populaire de l'univers !\"].buttons[\"Dernière partie Octans – Joueurs en ligne : 115\"]",".buttons[\"Dernière partie Octans – Joueurs en ligne : 115\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func sendExpe() {
        
//        let webViewsQuery = XCUIApplication().webViews.webViews.webViews
//        webViewsQuery/*@START_MENU_TOKEN@*/.images["et quand"]/*[[".otherElements[\"Octans OGame\"]",".links[\"et quand\"].images[\"et quand\"]",".images[\"et quand\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        webViewsQuery.otherElements["Octans OGame"].children(matching: .other).element(boundBy: 19)/*@START_MENU_TOKEN@*/.staticTexts["Flotte"]/*[[".links[\"Flotte\"].staticTexts[\"Flotte\"]",".staticTexts[\"Flotte\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        var currentElement :
//        webViewsQuery/*@START_MENU_TOKEN@*/.otherElements["Faucheur"]/*[[".otherElements[\"Octans OGame\"].otherElements[\"Faucheur\"]",".otherElements[\"Faucheur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .textField).element.tap()
//
//        let textField = webViewsQuery/*@START_MENU_TOKEN@*/.otherElements["Éclaireur"]/*[[".otherElements[\"Octans OGame\"].otherElements[\"Éclaireur\"]",".otherElements[\"Éclaireur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .textField).element
//        textField.tap()
//        textField.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

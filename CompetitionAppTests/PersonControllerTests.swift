//
//  PersonControllerTests.swift
//  CompetitionAppTests
//
//  Created by Rahala, Jasamrit (Coll) on 17/06/2021.
//

import XCTest
@testable import CompetitionApp

class PersonControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRegistrationValid(){
        XCTAssertEqual(try registerUser(username: "username1", password: "password1", repeatPassword: "password1"), true)
        XCTAssertEqual(try registerUser(username: "username2", password: "password2", repeatPassword: "password2"), true)
        XCTAssertEqual(try registerUser(username: "username3", password: "password3", repeatPassword: "password3"), true)
    }
    
    func testRegistrationErroneous(){
        XCTAssertThrowsError(try registerUser(username: "username4", password: "simple", repeatPassword: "simple")) // password too simple (must contain a number)
        XCTAssertThrowsError(try registerUser(username: "username5", password: "1234abcd", repeatPassword: "abcd1234")) // passwords do not match
        XCTAssertThrowsError(try registerUser(username: "username123456789", password: "password6", repeatPassword: "password6")) // username is too long
        
    }
    
    func testRegistrationBoundary(){
        XCTAssertThrowsError(try registerUser(username: "a", password: "password7", repeatPassword: "password7")) // username is too short
        XCTAssertThrowsError(try registerUser(username: "username8", password: "username8", repeatPassword: "username8")) // password matches username
        XCTAssertThrowsError(try registerUser(username: "username1", password: "password9", repeatPassword: "password9")) // username is already taken
    }

    
    func testLoginValid(){
        XCTAssertEqual(try User(username: "username1", password: "password1"), true)
        XCTAssertEqual(try User(username: "username2", password: "password2"), true)
        XCTAssertEqual(try User(username: "username3", password: "password3"), true)
    }
    
    func testLoginErroneous(){
        XCTAssertThrowsError(try User(username: "username4", password: "simple")) // password too simple (must contain a number)
        XCTAssertThrowsError(try User(username: "username5", password: "1234abcd")) // passwords do not match
        XCTAssertThrowsError(try User(username: "username123456789", password: "password6")) // username is too long
        
    }
    
    func testLoginBoundary(){
        XCTAssertThrowsError(try User(username: "a", password: "password7")) // username is too short
        XCTAssertThrowsError(try User(username: "username8", password: "username8")) // password matches username
        XCTAssertThrowsError(try User(username: "username1", password: "password9")) // username is already taken
    }

}

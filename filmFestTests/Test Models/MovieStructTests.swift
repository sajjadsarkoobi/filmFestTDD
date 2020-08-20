//
//  MovieStructTests.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import XCTest
@testable import filmFest

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testInit_MovieWithTitle(){
        let testMovie = Movie(title:"Generic Blockbustor")
        
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbustor")
        
    }
    
    
    func testInit_SetMovieTitleAndReleaseDate(){
        
        let testMovie = Movie(title:"Romantic Comedy", releaseDate:"1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
        
    }
    
    
    func testEquatable_returnsTrue(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
        
    }
    
    
    
    func testEquatableWithReleaseDate_returnsFalse(){
        let actionMovie1 = Movie(title: "Action",releaseDate: "1980")
        let actionMovie2 = Movie(title: "Action",releaseDate: "1981")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
        
    }
    
}

//
//  MovieCellTests.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/20/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import XCTest
@testable import filmFest


class MovieCellTests: XCTestCase {

    var tableview:UITableView!
    var mockDataSource:MockCellDataSource!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(identifier: "LibraryViewControllerID") as LibraryViewController
        
        _ = libraryVC.view
        
        tableview = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableview.dataSource = mockDataSource
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testCell_Config_ShoulSetLablesToMovieData(){
        let cell = tableview.dequeueReusableCell(withIdentifier: "movieCellId", for: IndexPath(row: 0, section: 0)) as! MovieCell
        
        cell.configMovieCell(movie: Movie(title: "Comedy",releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
        
    }

}

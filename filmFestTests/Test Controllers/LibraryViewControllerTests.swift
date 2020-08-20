//
//  LibraryViewControllerTests.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import XCTest
@testable import filmFest


class LibraryViewControllerTests: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        
        //Sajjad: We have to call didload always to test all vc
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //MARK: Nil check
    func testLibraryVC_TableViewShouldNotBeNil(){
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    
    
    //MARK: Data Source
    func testDataSource_viewDidLoad_SetsTableViewDataSource(){
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    
    //MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate(){
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObjects(){
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService) 
    }

}

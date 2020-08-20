//
//  MovieLibraryDataServiceTests.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/20/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import XCTest
@testable import filmFest


class MovieLibraryDataServiceTests: XCTestCase {

    
    var sut: MovieLibraryDataService!
    var tableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock:TableViewMock!
    
    
    let fairyTale = Movie(title: "Fairyy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComdey = Movie(title: "Dark Comedy")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    
    func testTableViewSections_Count_ReturnsTwo(){
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableviewSections_SectionOne_ReturnsMoviesToSeeCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: thriller)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        
        sut.movieManager?.addMovie(movie: darkComdey)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
        
    }
    
    func testTableViewSections_SectionTwo_ReturnMovieSeenCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: thriller)
        tableView.reloadData()
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
        
    }
    
    
    //MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell(){
    
        sut.movieManager?.addMovie(movie: darkComdey)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is MovieCell)
    
    }
        
        
    func testCell_ShouldDequeCell(){

        
        sut.movieManager?.addMovie(movie: thriller)
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequedProperly)
        
    }
    
    
    
    func testCell_sectionOneConfig_ShouldCellData(){

        
        
        sut.movieManager?.addMovie(movie: fairyTale)
        tableViewMock.reloadData()
        
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    
    func testCell_sectionTwoConfig_ShouldCellData(){

        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComdey)
        
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
    }
    
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
        let section1Title = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: 0)
        let section2Title = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }

}





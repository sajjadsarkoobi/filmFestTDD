//
//  MovieManagerTest.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import XCTest
@testable import filmFest


class MovieManagerTest: XCTestCase {

    
    var sut:MovieManager!
    
    let scifiMovie = Movie(title: "Sci-fi")
    let arthousMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    //MARK: Initial Values
    func testInit_MoviesToSee_ReturnZero(){
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: ADD & Query
    func testAdd_MoviesToSee_ReturnsOne(){
      
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
    }
    
    
    func testQuery_RetrunMovieAtIndex(){

        sut.addMovie(movie: arthousMovie)

        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthousMovie.title, movieQueried.title)
        
    }
    
    
    //MARK: Checking Off
    func testCheckOffMovie_UpdateMovieManagerCounts(){
        
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthousMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthousMovie.title)

    }
    
    
    func testCheckOffMovie_returnMovieAtIndex(){
        
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    

    
    //MARK: Clearing and reseting
    func testClearArrays_ReturnsArrayCountsOfZero(){
        
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    
    
    //MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
    }
}

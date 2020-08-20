//
//  MockExtentions.swift
//  filmFestTests
//
//  Created by Sajjad Sarkoobi on 8/20/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import Foundation
import UIKit


@testable import filmFest


extension MovieLibraryDataServiceTests {
    
    
    class TableViewMock: UITableView {
        
        var cellDequedProperly = false
        
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
            
            return mock
            
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String,for indexPath: IndexPath) -> UITableViewCell {
            
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
    }
    
    
    
    class MovieCellMock:MovieCell {
        var movieData:Movie?
        
        override func configMovieCell(movie: Movie){
            movieData = movie
        }
        
        
        
    }
    
}



extension MovieCellTests{
    
    class MockCellDataSource:NSObject,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}

//
//  MovieLibraryDataService.swift
//  filmFest
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import UIKit

enum LibrarySection:Int {
    case MoviesToSee
    case MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource,UITableViewDelegate {
    
    

    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0}
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) :
            movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        
        cell.configMovieCell(movie: movieData)
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        if librarySection == .MoviesToSee {
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
        
        
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else {
                   fatalError()
               }
        
        let sectionTitle = librarySection == .MoviesSeen ? "Movies Seen" : "Movies To See"
        
        return sectionTitle
    }
    
}

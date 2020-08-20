//
//  LibraryViewController.swift
//  filmFest
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    
    @IBOutlet var dataService:MovieLibraryDataService!
    
    
    var movieManager = MovieManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        movieManager.addMovie(movie: Movie(title: "Matrix"))

        movieManager.addMovie(movie: Movie(title: "Jumanji",releaseDate: "1989"))
        movieManager.addMovie(movie: Movie(title: "Sample Movie",releaseDate: "1989"))
        
        
        movieManager.addMovie(movie: Movie(title: "Action"))
        movieManager.addMovie(movie: Movie(title: "Horror" , releaseDate: "2002"))
        
        libraryTableView.reloadData()
    }


}


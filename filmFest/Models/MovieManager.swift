//
//  MovieManager.swift
//  filmFest
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import Foundation


class MovieManager {
    
    
    var moviesToSeeCount:Int {
        return moviesToSeeArray.count
    }
    
    var moviesSeenCount:Int {
        return moviesSeenArray.count
    }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie:Movie){
        
        if !moviesToSeeArray.contains(movie){
            moviesToSeeArray.append(movie)
        }
    }
    
    
    func movieAtIndex(index:Int) -> Movie{
        return moviesToSeeArray[index]
    }
    
    
    func checkOffMovieAtIndex(index: Int){
        
        guard index < moviesToSeeArray.count else {return}
        
        
        let checkedMovie = moviesToSeeArray[index]
        moviesSeenArray.append(checkedMovie)
        
        moviesToSeeArray.remove(at: index)
        
  
    }
    
    
    func checkedOffMovieAtIndex(index: Int) -> Movie{
        
        return moviesSeenArray[index]
    }
    
    
    func clearArrays(){
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
    
}

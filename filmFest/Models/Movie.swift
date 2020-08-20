//
//  Movie.swift
//  filmFest
//
//  Created by Sajjad Sarkoobi on 8/19/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import Foundation


struct Movie: Equatable{
    let title:String
    let releaseDate:String?
    
    
    init(title:String, releaseDate:String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    
}



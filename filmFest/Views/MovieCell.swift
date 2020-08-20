//
//  MovieCell.swift
//  filmFest
//
//  Created by Sajjad Sarkoobi on 8/20/20.
//  Copyright © 2020 sajjad. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func configMovieCell(movie: Movie){
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }

}

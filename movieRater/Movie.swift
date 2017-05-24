//
//  Movie.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/23/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import Foundation


public class Movie {
    var Rating: Double
    var Title: String
    var pRating: Double?
    
    public init(title: String, DbRating r: Double) {
        Title = title
        Rating = r
    }
}

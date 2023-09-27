//
//  MostPopularMovies.swift
//  MovieQuiz
//
//  Created by Дмитрий Калько on 27.09.2023.
//

import Foundation

//структуры которые будут дублировать компоновку JSON

struct MostPopularMovies: Codable {
    let errorMessage: String
    let items: [MostPopularMovie]
}

struct MostPopularMovie: Codable {
    let title: String
    let rating: String
    let imageURL: URL
    
    var resizedImageURL: URL {
        
        let urlString = imageURL.absoluteString
        
        let imageUrlString = urlString.components(separatedBy: "._")[0] + "._V0_UX600.jpg"
        
        guard let newURL = URL(string: imageUrlString) else {
            return imageURL
        }
        return newURL
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "fullTitle"
        case rating = "imDbRating"
        case imageURL = "image"
    }
}
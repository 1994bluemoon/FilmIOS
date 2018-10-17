//
//  FilmPlistLocalData.swift
//  Film
//
//  Created by Dương Hoàng on 10/15/18.
//  Copyright © 2018 henry. All rights reserved.
//

import Foundation

class FilmPlistLocalData {
    
    static let share = FilmPlistLocalData()
    private var films: [String: [[String: String]]] = [:]

    private init() {
        films = getNSDictionary(resource: "PlistFilmData")
    }
    
    func getFilmData(byKey: String) -> [Film] {
        guard let array = films[byKey] else { return [] }
        return convertDicToFilm(films: array)
    }
    
    private func getNSDictionary(resource: String) -> [String:[[String:String]]] {
        if let path = Bundle.main.path(forResource: resource, ofType: "plist") {
            if NSDictionary(contentsOfFile: path) != nil {
                return NSDictionary(contentsOfFile: path) as! [String:[[String:String]]]
            }
        }
        return [:]
    }
    
    private func convertDicToFilm(films: [[String:String]]) -> [Film] {
        var listFilms: [Film] = []
        for item in films {
            let film = Film(filmDic: item)
            listFilms.append(film)
        }
        return listFilms
    }
}

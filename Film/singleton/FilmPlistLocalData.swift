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

    private init() {
        
    }
    
    func getFilmData(fromResourceFile: String, byKey: String) -> [Film] {
        let resource = getNSDictionary(resource: fromResourceFile)
        let array = getFilmDicArray(fromResource: resource, byKey: byKey)
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
    
    private func getFilmDicArray(fromResource: [String:[[String:String]]], byKey: String) -> [[String:String]] {
        guard let films = fromResource[byKey] else {
            return []
        }
        return films
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

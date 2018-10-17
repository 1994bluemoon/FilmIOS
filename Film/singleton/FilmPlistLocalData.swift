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
    private var films: [String: Any] = [:]

    private init() {
        films = getNSDictionary(resource: "PlistFilmData")
    }
    
    func getFilmData(byKey: String) -> [Film] {
        guard let array = films[byKey] as? [[String:String]] else { return [] }
        return convertDicToFilm(films: array)
    }
    
    private func getNSDictionary(resource: String) -> [String:Any] {
        if let path = Bundle.main.path(forResource: resource, ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String:Any] {
                return dic
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

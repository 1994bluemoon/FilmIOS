//
//  FilmPlistLocalData.swift
//  Film
//
//  Created by Dương Hoàng on 10/15/18.
//  Copyright © 2018 henry. All rights reserved.
//

import Foundation

class FilmPlistLocalData {
    
    public static let share = FilmPlistLocalData()
    
    private var filmData = NSDictionary()

    private init() {
        if let path = Bundle.main.path(forResource: "PlistFilmData", ofType: "plist") {
            if NSDictionary(contentsOfFile: path) != nil {
                filmData = NSDictionary(contentsOfFile: path)!
            }
        }
    }
    
    func getUpComming() -> [Film] {
        let array = getUpcomingFilmNSArray()
        return convertDicToFilm(films: array)
    }
    
    func getNowPlaying() -> [Film] {
        let array = getNowPlayingFilmNSArray()
        return convertDicToFilm(films: array)
    }
    
    private func getUpcomingFilmNSArray() -> NSArray {
        guard let films = filmData["PhimSapChieu"] as? NSArray else {
            return NSArray.init()
        }
        return films
    }
    
    private func getNowPlayingFilmNSArray() -> NSArray {
        guard let films = filmData["PhimDangChieu"] as? NSArray else {
            return NSArray.init()
        }
        return films
    }
    
    private func convertDicToFilm(films: NSArray) -> [Film] {
        var listFilms: [Film] = []
        for index in 0...films.count - 1 {
            let item = films[index] as! NSDictionary
            let film = Film(title: item["title"] as! String, description: item["description"] as! String, logoPath: item["logoPath"] as! String, backDropPath: item["backDropPath"] as! String)
            listFilms.append(film)
        }
        return listFilms
    }
}

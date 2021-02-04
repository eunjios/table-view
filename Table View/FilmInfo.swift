//
//  FilmInfo.swift
//  Table View
//
//  Created by 이은지 on 2021/02/04.
//

import UIKit

struct FilmInfo {
    let camera: String
    let film: String
    let filmLab: String
    let date: String
    
    init(camera: String, film: String, filmLab: String, date: String) {
        self.camera = camera
        self.film = film
        self.filmLab = filmLab
        self.date = date
    }
}

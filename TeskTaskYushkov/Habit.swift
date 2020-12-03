//
//  Habit.swift
//  TeskTaskYushkov
//
//  Created by Иван Юшков on 03.12.2020.
//

import Foundation

struct Habit {
    let id: String
    let title: String
    
    init(data: Datum) {
        self.id = String(data.id)
        self.title = data.title
    }
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}

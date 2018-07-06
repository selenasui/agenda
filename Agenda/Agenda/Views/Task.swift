//
//  Task.swift
//  Agenda
//
//  Created by Binjia Chen on 7/6/18.
//  Copyright © 2018 Selena Sui. All rights reserved.
//

import Foundation


class Task {
    var title: String
    var timestamp: Date
    var description: String
    
    init(title: String, timestamp: Date, description: String) {
        self.title = title
        self.timestamp = timestamp
        self.description = description
    }
}

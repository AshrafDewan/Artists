//
//  Artist.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import Foundation

struct Artist: Codable {
    var name: String
    var bio: String
    var works: [Work]
}

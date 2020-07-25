//
//  ArtCell.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import UIKit

class ArtCell: UITableViewCell {
    @IBOutlet private weak var paintTitle: UITextField!
    @IBOutlet private weak var artImageView: UIImageView!
    
    func viewArt(art: Work) {
        paintTitle.text = art.title
        artImageView.image = UIImage(named: art.title)
    }
}

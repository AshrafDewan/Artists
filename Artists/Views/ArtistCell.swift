//
//  ArtistCell.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import UIKit

class ArtistCell: UITableViewCell {
    @IBOutlet private weak var artistName: UITextField!
    @IBOutlet private weak var artistBio: UITextView!
    @IBOutlet private weak var artistImageView: UIImageView!
    
    func viewArtist(artist: Artist) {
        artistName.text = artist.name
        artistBio.text = artist.bio
        artistImageView.image = UIImage(named: artist.name)
    }
}

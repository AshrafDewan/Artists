//
//  ArtDescriptionViewController.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import UIKit

class ArtDescriptionViewController: UIViewController {
    @IBOutlet private weak var artDescription: UITextView!
    
    var artDescriptionText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        artDescription.text = artDescriptionText
    }
}

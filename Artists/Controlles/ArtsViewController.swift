//
//  ArtistViewController.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import UIKit

class ArtsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var works = [Work]()
    var selection: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

// MARK : - UITableViewDataSource Functions

extension ArtsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCell", for: indexPath) as! ArtCell
        selection = indexPath.row
        let work = works[indexPath.row]
        
        cell.viewArt(art: work)
        
        return cell
    }
}

// MARK : - Private Functions

extension ArtsViewController {
    @IBAction private func infoButtonTapped(_ sender: UIButton) {
        let work = works[selection!]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "ArtDescriptionViewController") as? ArtDescriptionViewController else { return }
        vc.artDescriptionText = work.info
        navigationController?.pushViewController(vc, animated: true)
    }
}

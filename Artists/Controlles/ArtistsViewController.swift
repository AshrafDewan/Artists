//
//  ArtistsViewController.swift
//  Artists
//
//  Created by Ashraf Dewan on 7/16/20.
//  Copyright © 2020 Ashraf Dewan. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var artists = [Artist]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SwiftyCamp"
        loadArtists()
    }
}

// MARK : - UITableViewDataSource Functions

extension ArtistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath) as! ArtistCell
        let artist = artists[indexPath.row]
        
        cell.viewArtist(artist: artist)
        
        return cell
    }
}

// MARK : - UITableViewDataSource Functions

extension ArtistsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = artists[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "ArtsViewController") as? ArtsViewController else { return }
        vc.title = artist.name
        vc.works = artist.works
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK : - Private Functions

extension ArtistsViewController {
    private func loadArtists() {
        let stringPath = Bundle.main.path(forResource: "artistsList", ofType: "json")!
        let url = URL(fileURLWithPath: stringPath)
        
        if let data = try? Data(contentsOf: url) {
            parse(json: data)
        } else {
            showError()
        }
    }
    

    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonArtists = try? decoder.decode(Artists.self, from: json) {
            artists = jsonArtists.artists
            tableView.reloadData()
        } else {
            showError()
        }
    }
    
    private func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem leading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

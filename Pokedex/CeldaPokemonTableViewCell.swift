//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Jorge Rivera on 29/11/22.
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var DefendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pokemonImageView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

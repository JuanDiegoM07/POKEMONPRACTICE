//
//  ViewController.swift
//  Pokedex
//
//  Created by Jorge Rivera on 29/11/22.
//

import UIKit

class ListaPokemonViewController: UIViewController {
    
    
    // MARK: - Variables
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var PokemonTableView: UITableView!
    @IBOutlet weak var PokemonSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registrar la nueva celda
        PokemonTableView.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        pokemonManager.delegado = self
        PokemonTableView.delegate = self
        PokemonTableView.dataSource = self
        
        //Ejecucion del metodo para buscar la lista de ejecucion
        pokemonManager.verPokemon()
    }
}

// MARK: - Delegado Pokemon
extension ListaPokemonViewController: pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        
        DispatchQueue.main.async {
            self.PokemonTableView.reloadData()
        }
    }
}

// MARK: - Table
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PokemonTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CeldaPokemonTableViewCell
        cell.nameLabel.text = pokemons[indexPath.row].name
        cell.attackLabel.text = "Ataque: \(pokemons[indexPath.row].attack)"
        cell.DefendLabel.text = "Defensa: \(pokemons[indexPath.row].defense)"
        
        //Celda imagen desde url
        if let urlString = pokemons[indexPath.row].imageUrl as? String {
            if let imageURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.pokemonImageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
}

//
//  RecipeDetailView.swift
//  Recetas
//
//  Created by IDS on 7/9/19.
//  Copyright © 2019 IDS. All rights reserved.
//

import UIKit

class RecipeDetailView: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingButton: UIButton!
    
    
    var recipe : Recipe!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = recipe.name
        self.recipeImageView.image = self.recipe.image
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewVC = segue.source as? ReviewViewController{
            if let rating = reviewVC.ratingSelected {
                self.ratingButton.setImage(UIImage(named: rating), for: .normal)
                
            }
        }
    }
}


extension RecipeDetailView : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 3
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row{
            case 0:
                cell.kryLabel.text = "Nombre"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.kryLabel.text = "Tiempo"
                cell.valueLabel.text = "\(self.recipe.time!) :min"
            case 2:
                cell.kryLabel.text = "Favorita"
                if self.recipe.isFavorite{
                    cell.valueLabel.text = "Si"
                }else{
                    cell.valueLabel.text = "No"
                }
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.kryLabel.text = "Ingredientes:"
            }else{
                cell.kryLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.kryLabel.text = "Pasos:"
            }else {
                cell.kryLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        title = ""
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
    
    
}




extension RecipeDetailView : UITableViewDelegate{
    
}

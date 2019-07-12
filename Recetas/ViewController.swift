//
//  ViewController.swift
//  Recetas
//
//  Created by IDS on 7/5/19.
//  Copyright © 2019 IDS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var recipes : [Recipe] = []
//    var cellView : RecipeCell = RecipeCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        var recipe = Recipe("Tortilla de patata", "tortilla_patata.jpg" , 15 , ["bla bla","bla bla","bla bla"], ["bla bla bla bla bla bla bla bla","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum","bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla"])
        recipes.append(recipe)

        recipe = Recipe("Pizza margarita", "pizza_margrita.jpg" , 15 , ["bla bla","bla bla","bla bla"], ["bla bla","bla bla","bla bla"])
        recipes.append(recipe)

        recipe = Recipe("Hamburgesa con queso", "hamburgesa.jpg" , 15 , ["bla bla","bla bla","bla bla"], ["bla bla","bla bla","bla bla"])
        recipes.append(recipe)
        
        recipe = Recipe("Ensalada Cesar", "ensalada_cesar.jpg" , 15 , ["bla bla","bla bla","bla bla"], ["bla bla","bla bla","bla bla"])
        recipes.append(recipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.labelName.text = recipe.name!
        cell.labelTime.text = "\(recipe.time!) min"
        cell.labelIngredients.text = "Ingredientes \(recipe.ingredients.count)"
        if recipe.image != nil{
           cell.imageRecipe.image = recipe.image
        }
        if recipe.isFavorite{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        cell.imageRecipe.layer.cornerRadius = 50.0
        cell.imageRecipe.clipsToBounds = true
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.recipes.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, IndexPath) in
            let shareDefalutText = "Hola te comparto la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10"
            
            let activictyController = UIActivityViewController(activityItems: [shareDefalutText], applicationActivities: nil)
            self.present(activictyController, animated: true, completion: nil)
            
        }
        shareAction.backgroundColor = .blue
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, IndexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .gray
        
        return [shareAction, deleteAction]
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let recipe = self.recipes[indexPath.row]
        
        let alertControler = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        alertControler.addAction(cancelAction)
        
        var foriteActionTitle = "Favorito"
        if recipe.isFavorite{
            foriteActionTitle = "No Favorito"
        }
        
        let favoriteAction = UIAlertAction(title: foriteActionTitle, style: .default) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        
        alertControler.addAction(favoriteAction)
        self.present(alertControler, animated: true, completion: nil)*/
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! RecipeDetailView
                destinationViewController.recipe = selectedRecipe
            }
        }
    }

}


//
//  Recipe.swift
//  Recetas
//
//  Created by IDS on 7/5/19.
//  Copyright © 2019 IDS. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    var isFavorite = false

    init (_ name : String!, _ imageName : String!, _ time : Int!, _ ingredients : [String]!, _ steps : [String]!){
        self.name = name
        if let imageName = imageName {
            self.image = UIImage(named : imageName)
        }
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
        
    }
    
}

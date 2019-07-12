//
//  ReviewViewController.swift
//  Recetas
//
//  Created by IDS on 7/11/19.
//  Copyright © 2019 IDS. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgraundImageView: UIImageView!
    @IBOutlet weak var ratingStackVire: UIStackView!
    
    
     var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgraundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        ratingStackVire.transform = scale.concatenating(translation) // Combinar escalado con translación
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackVire.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
         }, completion: nil)
 
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
//            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: { (success) in
//            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
//                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            }, completion: { (success) in
//                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
//                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                }, completion: nil)
//            })
//        })
        
        
    }

    @IBAction func ratingPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}

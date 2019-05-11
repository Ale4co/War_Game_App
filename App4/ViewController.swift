//
//  ViewController.swift
//  App4
//
//  Created by Alexander Rombak on 23/03/2019.
//  Copyright © 2019 Alexander Rombak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func exitTapped(_ sender: Any) {
        // shows confirmation message to user
        let alertController = UIAlertController(title: "Confirmation", message: "Do you want to exit?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action) in
            // home button press programmatically
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            
            // wait 2 seconds while app is going background
            Thread.sleep(forTimeInterval: 2)
            
            // exit app when app is in background
            print("exit(0)")
            exit(0)
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func dealTapped(_ sender: Any) {
        
        //Randomize card numbers
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        //Update the card image
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if (rightScore < 10 && leftScore < 10) {
            //comparing left to right scores
            if leftNumber > rightNumber {
                leftScore += 1
                leftScoreLabel.text = String(leftScore)
            }
                
            else if leftNumber < rightNumber {
                rightScore += 1
                rightScoreLabel.text = String(rightScore)
            }
                
            else {
                let alert = UIAlertController(title: "It's a Draw", message: "Both of the cards are equal...", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Continue playing", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                
            }
       }
        
      else if leftScore < rightScore {
            
            let alertEnd = UIAlertController(title: "GAME OVER", message: "CPU has won the game LOL", preferredStyle: .alert)
            
            alertEnd.addAction(UIAlertAction(title: "New game", style: .default, handler: nil))
            alertEnd.addAction(UIAlertAction(title: "Close app", style: .default, handler: exitTapped(_:)))
            
            self.present(alertEnd, animated: true)
        }
        
        else {
            let alertEnd = UIAlertController(title: "Great Success - You've Won !!!", message: "You are the true master of this game", preferredStyle: .alert)
            
            alertEnd.addAction(UIAlertAction(title: "New game", style: .default, handler: nil))
            alertEnd.addAction(UIAlertAction(title: "Close app", style: .default, handler: exitTapped(_:)
            ))
            
            self.present(alertEnd, animated: true)
  
        }
 
    }

}


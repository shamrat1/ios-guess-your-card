//
//  ViewController.swift
//  Guess Your Card
//
//  Created by Leads Computer on 11/27/19.
//

import UIKit

class ViewController: UIViewController {
    let img0 = UIImage(named: "1")
    let img1 = UIImage(named: "2")
    let img2 = UIImage(named: "3")
    let img3 = UIImage(named: "4")
    let quesMark = UIImage(named: "questionMark")
    
    var selected = 0, activeImage = 0 , random = 0, currentScore = 0, currentTires = 0, counter = 1, totalTries = 10
    
    @IBOutlet weak var tries: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        score.text = String(currentScore)
        tries.text = String(totalTries)
        
        
        
    }

    @IBAction func cardAction(_ sender: UIButton) {
            if counter < totalTries {
                random = Int(arc4random_uniform(4))
                if sender.tag == random {
                    currentScore += 1
                    score.text = String(currentScore)
                }
                
                if random == 0 {
                    imageView.image = img0
                }else if random == 1 {
                    imageView.image = img1
                }else if random == 2 {
                    imageView.image = img2
                }else {
                    imageView.image = img3
                }
                currentTires = totalTries - counter
                tries.text = String(currentTires)
                UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.imageView.image = self.quesMark
                    UIView.transition(with: self.imageView, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
                })
            }else {
                showSimpleAlert()
                currentScore = 0
                score.text = String(currentScore)
                tries.text = String(totalTries)
                counter = 0
            }
            counter += 1
        
        
    }
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Game Over", message: "Your Score is \(currentScore)", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


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
    
    var selected = 0, activeImage = 0 , random = 0, currentScore = 0, currentTires = 0
    
    @IBOutlet weak var tries: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        score.text = "0"
        tries.text = String(5)
        
    }

    @IBAction func cardAction(_ sender: UIButton) {
        random = Int(arc4random_uniform(4))
        if sender.tag == random {
            currentScore += 1
            score.text = String(currentScore)
        }else {
            if currentScore == 0 {
                currentScore = 0
            }else {
                currentScore -= 1
            }
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
        
        
        UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
  
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.imageView.image = self.quesMark
            UIView.transition(with: self.imageView, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        })
    }
    
}


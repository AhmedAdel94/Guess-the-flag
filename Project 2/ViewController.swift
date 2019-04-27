//
//  ViewController.swift
//  Project 2
//
//  Created by Ahmed Adel on 3/27/19.
//  Copyright © 2019 Ahmed Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var playerScore: UILabel!
    
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button1.layer.borderWidth=1
        button2.layer.borderWidth=1
        button3.layer.borderWidth=1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        
        askQuestion()
    }
    
    func askQuestion(action:UIAlertAction! = nil)
    {
        countries.shuffle()
        
        button1.setImage(UIImage(named:countries[0]), for: .normal)
        button2.setImage(UIImage(named:countries[1]), for: .normal)
        button3.setImage(UIImage(named:countries[2]), for: .normal)
        
        correctAnswer = Int.random(in:0...2)
        title = countries[correctAnswer].uppercased()

    }
    
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        var title:String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            playerScore.text = "Score: \(score)"
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title:"Continue",style:.default,handler:askQuestion))
        present(ac,animated: true)
    }


}


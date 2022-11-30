//
//  ViewController.swift
//  GuesstheFlag
//
//  Created by Ozan Mudul on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var question = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        
    }
    
    func restart(action: UIAlertAction) {
        score = 0
        question = 0
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if question < 10 {
            question += 1
            
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            title = "Country: \(countries[correctAnswer].uppercased()) Score: \(score)"
        }
        else {
            let ac = UIAlertController(title: "Final Results", message: "Your final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restart))
            present(ac, animated: true)
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message = ""
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "Wrong"
            message = "Wrong! That's the flag of \(countries[correctAnswer].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}

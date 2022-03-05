//
//  ViewController.swift
//  Project2
//
//  Created by hashmi on 27/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 1
    var alertTitle = ""
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monoco", "nigeria",
                      "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Score \(finalScore) \t\(countries[(correctAnswer)].uppercased())"
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.masksToBounds = true
        button2.layer.masksToBounds = true
        button3.layer.masksToBounds = true
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            score += 1
            alertTitle = "Correct🙂"
            finalScore += 1
        } else {
            if score >= 1 {
                score -= 1
            }
            alertTitle = "Wrong Flag 😞\(countries[sender.tag].uppercased())"
        }
        
        if questionAsked == 10 {
            alertTitle = "Completd 5 question"
            questionAsked = 0
            reset()
        }
        print(questionAsked)
        questionAsked += 1
        
        let ac = UIAlertController(title: alertTitle, message: "Your Score \(finalScore)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
       
    }
    
    func reset() {
      questionAsked = 0
    }
    
    @objc func showScore() {
        
        let ac = UIAlertController(title: "Score \(finalScore)", message: "Keep Playing", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

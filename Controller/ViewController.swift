//
//  ViewController.swift
//  Quizzler-iOS
//
//  Created by 🌟 marlin 🌟 on 1/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Answer-checking part
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let answerArray = quizBrain.getAnswer()
        print(answerArray)
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1Button.backgroundColor = UIColor.clear
        choice1Button.setTitle(answerArray[0], for: .normal)
        choice2Button.backgroundColor = UIColor.clear
        choice2Button.setTitle(answerArray[1], for: .normal)
        choice3Button.backgroundColor = UIColor.clear
        choice3Button.setTitle(answerArray[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
    }
}


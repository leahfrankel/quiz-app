//
//  ViewController.swift
//  quiz app
//
//  Created by Leah Frankel on 5/18/20.
//  Copyright © 2020 Leah Frankel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var Answer0: UIButton!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBAction func handleSubmitAnswer0(_ sender: Any) {
    }
    
    @IBAction func handleSubmitAnswer1(_ sender: Any) {
    }
    
    @IBAction func handleSubmitAnswer2(_ sender: Any) {
    }
    
    @IBAction func handleSubmitAnswer3(_ sender: Any) {
    }
    
    @IBOutlet weak var progressLabel: UILabel!
    
   func setQuestion() {
      questionLabel.text = currentQuestion!.question
      Answer0.setTitle(currentQuestion!.answers[0], for: .normal)
      Answer1.setTitle(currentQuestion!.answers[1], for: .normal)
      Answer2.setTitle(currentQuestion!.answers[2], for: .normal)
      Answer3.setTitle(currentQuestion!.answers[3], for: .normal)
      progressLabel.text = "Question \(currentQuestionPosition + 1) of \(questions.count)"
    
    //loadnextquestion:
    if ((currentQuestionPosition + 1) == questions.count) {
             performSegue(withIdentifier: "sgShowResults", sender: nil)
             }
             else {
        currentQuestionPosition += 1
             currentQuestion = questions[currentQuestionPosition]
             setQuestion() }
    
    //checkanswer:
    
    }
    
    
  
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
    Question(
        question: "What is my favorite color?",
        answers: ["pink", "blue", "yellow", "green"],
        correctAnswer: 2),
]
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    

    
    //More instances of Question should be inside this array.
    //You need one instance of Question for each question in your quiz.

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    
}


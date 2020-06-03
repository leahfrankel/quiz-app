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
               checkAnswer(choiceNo: 0)
    }
    
    @IBAction func handleSubmitAnswer1(_ sender: Any) {
         checkAnswer(choiceNo: 1)
    }
    
    @IBAction func handleSubmitAnswer2(_ sender: Any) {
         checkAnswer(choiceNo: 2)
    }
    
    @IBAction func handleSubmitAnswer3(_ sender: Any) {
         checkAnswer(choiceNo: 3)
    }
    
    @IBOutlet weak var progressLabel: UILabel!
    
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        Answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        Answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        Answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        Answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "QUESTION \(currentQuestionPosition + 1) OF \(questions.count)"
        
    }
    //loadnextquestion:
    func loadNextQuestion(){
        if ((currentQuestionPosition + 1) == questions.count) {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
        else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion() }
    }

func checkAnswer(choiceNo: Int){
    if (choiceNo == currentQuestion!.correctAnswer) {
        noCorrect += 1
        loadNextQuestion()
    }
    else {
        loadNextQuestion()
    }
    
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if(segue.identifier == "sgShowResults") {
        let vc = segue.destination as! RemoteViewController
        vc.noCorrect = noCorrect
        vc.total = questions.count
      }
    }

    //addnewhere

//checkanswer:
struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
}

var questions: [Question] = [
    Question(
        question: "WHAT IS MY FAVORITE COLOR?",
        answers: ["PINK", "BLUE", "YELLOW", "GREEN"],
        correctAnswer: 2),
   Question(
              question: "WHAT IS MY FAVORITE CHOCOLATE BAR",
              answers: ["KIT KAT", "TWIX", "MILKY WAY", "REECES"],
              correctAnswer: 3),
    Question(
               question: "WHAT IS MY FAVORITE SEASON?",
               answers: ["SPRING", "WINTER", "SUMMER", "FALL"],
               correctAnswer: 0),
    Question(
               question: "HOW MANY SIBLINGS DO I HAVE?",
               answers: ["3", "4", "2", "5"],
               correctAnswer: 0),
    Question(
                  question: "WHAT IS MY FAVORITE TYPE OF CAKE?",
                  answers: ["BROWNIES", "APPLE PIE", "CHEESECAKE", "BLONDIE"],
                  correctAnswer: 2),
    Question(
                  question: "WHAT IS MY MOM'S NAME?",
                  answers: ["BRACHA", "ADINA", "SUSAN", "TINA"],
                  correctAnswer: 1),



]
var currentQuestion: Question?
var currentQuestionPosition: Int = 0
var noCorrect: Int = 0



//More instances of Question should be inside this array.
//You need one instance of Question for each question in your quiz.


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view
    // Setup the question and reset currentQuestion
    currentQuestion = questions[0]
    setQuestion()

}



}



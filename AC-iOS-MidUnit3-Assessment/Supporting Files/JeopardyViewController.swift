//
//  JeopardyViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by Keshawn Swanston on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class JeopardyViewController: UIViewController, UITextFieldDelegate {
    
    var questions = [Question]()
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var jeopardyImageView: UIImageView!
    @IBOutlet weak var catergoryLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var nextQuestButton: UIButton!
    @IBAction func nextQuestButtonPressed(_ sender: UIButton) {
        let newNextQuest = getNextQuest()
        questionLabel.text = newNextQuest
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.delegate = self
        jeopardyImageView.image = UIImage(named: "jeopardyLogo")
        loadData()
        self.questionLabel.text = getNextQuest()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "jeopardyinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.questions = Question.getQuestions(from: data)
            }
        }
    }
    
    func getNextQuest() -> String {
        var questArr = [questions]
        currentIndex += 1
        if currentIndex > questArr.count - 1 {
            currentIndex = 0
        }
        let returnLine = questArr[currentIndex]
        return String(describing: returnLine)
    }
    
    private var currentIndex = 0
 
    
    
    
    
    
    
    
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        guard let answer = answerTextField.text else {
//            return false
//        }
//        switch questions.checkAnswer(here: answer ) {
//        case .valid:
//            resultLabel.text = "Correct"
//        case .invalid:
//            resultLabel.text = "Wrong, \(questions.answer) was the correct answer"
//        }
//        textField.resignFirstResponder()
//        return true
//    }

}

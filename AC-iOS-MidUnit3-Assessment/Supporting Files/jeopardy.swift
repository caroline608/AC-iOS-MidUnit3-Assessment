//
//  jeopardy.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by Keshawn Swanston on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class Question {
    var answer: String
    var question: String
    var value: Int
    var category: String
    init(answer: String, question: String, value: Int, category: String) {
        self.answer = answer
        self.category = category
        self.question = question
        self.value = value
    }
    
  
    convenience init?(from dict: [String: Any]) {
        let anwserDict = dict["answer"] as? String ?? "Answer Unknown"
        guard let questDict = dict["question"] as? String else { return nil }
        guard let valueDict = dict["value"] as? Int else { return nil }
        guard let categoryDict = dict["category"] as? [String: Any] else { return nil }
        let theTitle = categoryDict["title"] as? String ?? "Category Unknown"
        self.init(answer: anwserDict, question: questDict, value: valueDict, category: theTitle)
    }
    
    
    static func getQuestions(from data: Data) -> [Question] {
        var questions = [Question]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = json as? [String: Any] else { return [] }
            guard let questArr = jsonDict["questions"] as? [[String: Any]] else {return [] }
            for questDict in questArr {
                if let newQuest = Question(from: questDict) {
                    questions.append(newQuest)
                }
            }
        }catch {
            print("Error")
        }
        return questions
    }
    
    enum Input {
        case valid
        case invalid
    }
    
//        
//        func checkAnswer(here: String) -> Input {
//            var answerArr:[Question.answer]
//            for answer in answerArr {
//                if answer.rawValue == here.lowercased().trimmingCharacters(in: CharacterSet.whitespaces) {
//                    return Input.valid
//                }
//            }
//            return Input.invalid
//        }
//        
     
    

}



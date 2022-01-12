//
//  Question.swift
//  Quizzler-iOS
//
//  Created by 🌟 marlin 🌟 on 1/12/22.
//

import Foundation

struct Question {
    let text:String
    let answer:[String]
    let correct:String
    
    init(q question:String, a ans:[String], correctAnswer c:String) {
        text = question
        answer = ans
        correct = c
    }
}

//
//  Exercise.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//
import Foundation

struct Exercise: Codable {
    let id: Int
    var type: String
    var prompt: String
    var question: String
    var options: [String]?
    var correctAnswer: String
}

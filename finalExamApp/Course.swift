//
//  Course.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021
//

import Foundation

// class for storing the course attributes
class Course {
    var courseName : String
    var courseHours : Int
    var courseFee : Int
    
    // initializer
    init(courseName: String, courseHours: Int, courseFee: Int) {
        self.courseName = courseName
        self.courseHours = courseHours
        self.courseFee = courseFee
    }
}

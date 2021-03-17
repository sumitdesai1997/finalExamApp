//
//  Course.swift
//  finalExamApp
//
//  Created by Sumit Desai on 12/27/1399 AP.
//

import Foundation

class Course {
    var courseName : String
    var courseHours : Int
    var courseFee : Int
    
    init(courseName: String, courseHours: Int, courseFee: Int) {
        self.courseName = courseName
        self.courseHours = courseHours
        self.courseFee = courseFee
    }
}

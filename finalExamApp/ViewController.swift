//
//  ViewController.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = courseTable.dequeueReusableCell(withIdentifier: "courseCell") as! CourseCellTableViewCell
        let course = courseList[indexPath.row]
        
        cell.setCourseCell(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseName = courseList[indexPath.row].courseName
        courseHours = courseList[indexPath.row].courseHours
        courseFee = courseList[indexPath.row].courseFee
    }
    

    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var courseTable: UITableView!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var fee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fillData()
        tableHeight.constant =  CGFloat(Double(courseList.count) * 44.0)
        
        courseTable.dataSource = self
        courseTable.delegate = self
        courseTable.tableFooterView = UIView()
        
        hours.text = String(0)
        fee.text = String(0)
    }
    
    var courseList = [Course]()
    var cartList = [Course]()
    var courseName = ""
    var courseHours = 0
    var courseFee = 0
    var grandTotalHours = 0
    var grandTotalFees = 0
    func fillData(){
        courseList.append(Course(courseName: "Java", courseHours: 5, courseFee: 1600))
        courseList.append(Course(courseName: "Python", courseHours: 4, courseFee: 1850))
        courseList.append(Course(courseName: "Database", courseHours: 3, courseFee: 1300))
        courseList.append(Course(courseName: "Web development", courseHours: 4, courseFee: 1200))
        courseList.append(Course(courseName: "iOS development", courseHours: 5, courseFee: 2200))
        courseList.append(Course(courseName: "Android development", courseHours: 5, courseFee: 2000))
        courseList.append(Course(courseName: "System analysis", courseHours: 4, courseFee: 1900))
        courseList.append(Course(courseName: "Cloud computing", courseHours: 3, courseFee: 1250))
        courseList.append(Course(courseName: "Machine learning", courseHours: 5, courseFee: 2300))
        courseList.append(Course(courseName: "Problem solving", courseHours: 3, courseFee: 950))
    }

    @IBAction func clickAddCourse(_ sender: Any) {
        grandTotalHours += courseHours
        grandTotalFees += courseFee
        cartList.append(Course(courseName: courseName, courseHours: courseHours, courseFee: courseFee))
        
        hours.text = String(grandTotalHours)
        fee.text = String(grandTotalFees)
        
    }
}


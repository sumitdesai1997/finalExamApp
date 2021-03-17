//
//  ViewController.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // function that will return number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    // function that will return the cell in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = courseTable.dequeueReusableCell(withIdentifier: "courseCell") as! CourseCellTableViewCell
        let course = courseList[indexPath.row]
        
        // function call to set the cell inside the table
        cell.setCourseCell(course: course)
        return cell
    }
    
    // function to perform the action on the click of row from the table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseName = courseList[indexPath.row].courseName
        courseHours = courseList[indexPath.row].courseHours
        courseFee = courseList[indexPath.row].courseFee
    }
    
    // outlet connections
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var courseTable: UITableView!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var fee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fillData()
        
        // to definde the height of table dynamically as per the course list length
        tableHeight.constant =  CGFloat(Double(courseList.count) * 44.0)
        
        courseTable.dataSource = self
        courseTable.delegate = self
        courseTable.tableFooterView = UIView()
        
        hours.text = String(grandTotalHours)
        fee.text = String(grandTotalFees)
    }
    
    var courseList = [Course]()
    var cartList = [Course]()
    var courseName = ""
    var courseHours = 0
    var courseFee = 0
    var grandTotalHours = 0
    var grandTotalFees = 0
    
    // function to fill the data for course list array
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

    // preparing the data while navigating to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! CartViewController
        
        cvc.cartList = cartList
        cvc.fees = grandTotalFees
        cvc.hours = grandTotalHours
    }
    
    // performing the segue action on click of show cart button
    @IBAction func clickShowCart(_ sender: Any) {
        performSegue(withIdentifier: "ShowCartToCart", sender: self)
    }
    
    // function to add the value in cart list array and perform the required validations
    @IBAction func clickAddCourse(_ sender: Any) {
        
        // if total hours greater than 19 hours then it alerts the user
        if(grandTotalHours + courseHours > 19){
            openAlert(title: "Alert", message: "Total course hours can not be more than 19 hours.", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in}])
            return
        }
        
        // if the same course is already exist in cart list then it alerts the user
        for cart in cartList{
            if(cart.courseName == courseName){
                openAlert(title: "Alert", message: "The same course can not be selected again.", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in}])
                return
            }
        }
        
        grandTotalHours += courseHours
        grandTotalFees += courseFee
        cartList.append(Course(courseName: courseName, courseHours: courseHours, courseFee: courseFee))
        
        hours.text = String(grandTotalHours)
        fee.text = String(grandTotalFees)
        
    }
}


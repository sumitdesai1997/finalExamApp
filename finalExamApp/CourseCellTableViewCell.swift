//
//  CourseCellTableViewCell.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021.
//

import UIKit

class CourseCellTableViewCell: UITableViewCell {

    // outlet connections for objects
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var fee: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // function to set the cell
    func setCourseCell(course: Course){
        name.text = course.courseName
        hours.text = String(course.courseHours)
        fee.text = String(course.courseFee)
    }

}

//
//  CourseCellTableViewCell.swift
//  finalExamApp
//
//  Created by Sumit Desai on 12/27/1399 AP.
//

import UIKit

class CourseCellTableViewCell: UITableViewCell {

    
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
    
    func setCourseCell(course: Course){
        name.text = course.courseName
        hours.text = String(course.courseHours)
        fee.text = String(course.courseFee)
    }

}

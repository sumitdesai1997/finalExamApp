//
//  CartTableViewCell.swift
//  finalExamApp
//
//  Created by Sumit Desai on 12/27/1399 AP.
//

import UIKit

class CartTableViewCell: UITableViewCell {

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

    func setCartCell(cart : Course){
        name.text = cart.courseName
        hours.text = String(cart.courseHours)
        fee.text = String(cart.courseFee)
    }
    
}

//
//  CartViewController.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // function that will return number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    // function that will return the cell in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTable.dequeueReusableCell(withIdentifier: "cartCell") as! CartTableViewCell
        let course = cartList[indexPath.row]
        
        // function call to set the cell inside the table
        cell.setCartCell(cart: course)
        return cell
    }
    
    // function to delete the course from the cart list
    // function to perform the action depending on the editing style
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the editing style is delete (swipe left on the row) then delete the row
        if editingStyle == .delete{
            // removing the course hours and course fees from the total hours and total fees
            hours -=  cartList[indexPath.row].courseHours
            fees -= cartList[indexPath.row].courseFee
            
            // removing the course from the cart list and from the table
            cartList.remove(at: indexPath.row)
            cartTable.deleteRows(at: [indexPath], with: .fade)
            
            hour.text = String(hours)
            fee.text = String(fees)
        }
    }

    // cartList array, hours and fees will have the value at the time of page load and it is that value which is passed from the course registration page
    var cartList = [Course]()
    var hours = 0
    var fees = 0
    
    // outlet connections for the objects
    @IBOutlet weak var cartTableHeight: NSLayoutConstraint!
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var fee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        cartTable.dataSource = self
        cartTable.delegate = self
        cartTable.tableFooterView = UIView()
       
        // to definde the height of table dynamically as per the cart list length
        cartTableHeight.constant = CGFloat(Double(cartList.count) * 44.0)
        
        hour.text = String(hours)
        fee.text = String(fees)
    }

    // preparing the data while navigating to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        
        vc.cartList = cartList
        vc.grandTotalFees = fees
        vc.grandTotalHours = hours
    }
    
    // action connection for previous button
    // function to perform the segue action on click of previous button
    @IBAction func clickPrev(_ sender: Any) {
        performSegue(withIdentifier: "PrevToView", sender: self)
    }
}

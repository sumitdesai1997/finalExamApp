//
//  CartViewController.swift
//  finalExamApp
//
//  Created by Sumit Desai on 12/27/1399 AP.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTable.dequeueReusableCell(withIdentifier: "cartCell") as! CartTableViewCell
        let course = cartList[indexPath.row]
        
        cell.setCartCell(cart: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            hours -=  cartList[indexPath.row].courseHours
            fees -= cartList[indexPath.row].courseFee
            cartList.remove(at: indexPath.row)
            cartTable.deleteRows(at: [indexPath], with: .fade)
            hour.text = String(hours)
            fee.text = String(fees)
        }
    }

    var cartList = [Course]()
    var hours = 0
    var fees = 0
    
    @IBOutlet weak var cartTableHeight: NSLayoutConstraint!
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var fee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTable.dataSource = self
        cartTable.delegate = self
        cartTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        
        cartTableHeight.constant = CGFloat(Double(cartList.count) * 44.0)
        hour.text = String(hours)
        fee.text = String(fees)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        
        vc.cartList = cartList
        vc.grandTotalFees = fees
        vc.grandTotalHours = hours
    }
    @IBAction func clickPrev(_ sender: Any) {
        
    }
}

//
//  Alert.swift
//  finalExamApp
//
//  Created by Sumit Desai, Mihin Patel on 17 March 2021.
//

import Foundation
import UIKit

extension UIViewController{
    
    // Global function for alert box
    public func openAlert(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){
        
        // creating object for alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        
        // creating multiple action on the basis of the action titiles and actions
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        
        self.present(alertController, animated: true)
    }
}

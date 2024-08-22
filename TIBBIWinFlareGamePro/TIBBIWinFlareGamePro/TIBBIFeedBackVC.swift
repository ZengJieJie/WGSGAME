//
//  FeedBackVC.swift
//  TIBBIWinFlareGamePro
//
//  Created by FJ on 02/04/24.
//

import UIKit

class TIBBIFeedBackVC: UIViewController {
    
    @IBOutlet weak var txtVWdesc        : UITextView!
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnStart(_ sender: Any) {
        
        guard !txtVWdesc.text.isEmpty else { return showAlert("Please Enter Feedback" , "")}
        self.showAlert("Your Feedback Send Successfully", "")
        
    }
    
    func showAlert(_ title :String,_ message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }

}

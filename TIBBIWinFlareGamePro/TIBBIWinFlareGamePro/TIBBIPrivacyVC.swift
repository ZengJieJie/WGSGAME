//
//  PrivacyVC.swift
//  TIBBIWinFlareGamePro
//
//  Created by FJ on 02/04/24.
//

import UIKit

class TIBBIPrivacyVC: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }

}

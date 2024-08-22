//
//  HomeVC.swift
//  Win Flare Game Pro
//
//  Created by FJ on 09/08/24.
//

import UIKit
import StoreKit

class TIBBIHomeVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrl1: UIScrollView!
    @IBOutlet weak var scrl2: UIScrollView!
    @IBOutlet weak var btnStart: UIButton!
    
    var isScrolling = false
    
    var currentIndex = 0{
        didSet{
            btnStart.tag = currentIndex
        }
    }
    
    let numberOfItems = 7
    var itemHeight: CGFloat = 100
    
    @IBOutlet weak var bbackclick: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrl1.delegate = self
        scrl2.delegate = self
        
        itemHeight = scrl2.bounds.width
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
    }
    
    @IBAction func clickbtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            if currentIndex < numberOfItems - 1 {
                currentIndex += 1
            }
        } else if gesture.direction == .right {
            if currentIndex > 0 {
                currentIndex -= 1
            }
        }
        moveToCurrentIndex()
    }
    
    func moveToCurrentIndex() {
        
        let yOffset = CGFloat(currentIndex) * (itemHeight + 500)
        
        scrl2.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
        
        scrl1.setContentOffset(CGPoint(x: yOffset, y: 0), animated: true)
        
    }
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        switch sender.tag{
            
        case 0: 
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PuzzleVC")as! TIBBIPuzzleVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
            
        case 1:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "SlotGameVC")as! TIBBISlotGameVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 2:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PuzzleCompVC")as! TIBBIPuzzleCompVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 3:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "FeedBackVC")as! TIBBIFeedBackVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 4:
            
            SKStoreReviewController.requestReview()
            
            break
            
        case 5:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PrivacyVC")as! TIBBIPrivacyVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 6:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TermsVC")as! TIBBITermsVC
            
            navigationController?.pushViewController(vc, animated: true)
            
            break
            
        default:
            
            SKStoreReviewController.requestReview()
            
            break
            
        }
        
    }
    
    
}

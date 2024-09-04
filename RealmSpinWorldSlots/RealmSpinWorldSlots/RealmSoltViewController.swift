//
//  RealmSoltViewController.swift
//  RealmSpinWorldSlots
//
//  Created by adin on 2024/9/4.
//

import UIKit

class RealmSoltViewController: UIViewController {

    
    @IBOutlet weak var slotImageView1: UIImageView!
    @IBOutlet weak var slotImageView2: UIImageView!
    @IBOutlet weak var slotImageView3: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    let slotImages = ["A1", "A2", "A3", "A4", "A5","A6", "A7", "A8", "A9"]
    
    
    var score = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the score label
        scoreLabel.text = "Score: \(score)"
    }
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        let randomIndex1 = Int.random(in: 0..<slotImages.count)
        let randomIndex2 = Int.random(in: 0..<slotImages.count)
        let randomIndex3 = Int.random(in: 0..<slotImages.count)
        
        // Set images to slot image views
        slotImageView1.image = UIImage(named: slotImages[randomIndex1])
        slotImageView2.image = UIImage(named: slotImages[randomIndex2])
        slotImageView3.image = UIImage(named: slotImages[randomIndex3])
        
        // Check if all slots match
        if randomIndex1 == randomIndex2 && randomIndex2 == randomIndex3 {
            
            score += 10
        } else {
            
            score -= 5
        }
                if score <= 0 {
                    showRestartAlert()
                } else {
                    scoreLabel.text = "Score: \(score)"
                }
        
    }
    
    private func showRestartAlert() {
            let alert = UIAlertController(title: "Game Over", message: "Your score is zero. Restart the game?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            present(alert, animated: true, completion: nil)
        }
    
    private func restartGame() {
            score = 100
            scoreLabel.text = "Score: \(score)"
            
            slotImageView1.image = UIImage(named: slotImages[0])
            slotImageView2.image = UIImage(named: slotImages[0])
            slotImageView3.image = UIImage(named: slotImages[0])
        }
    
    @IBAction func btnBackTapped(_ sender : Any){
        self.navigationController?.popViewController(animated: true)
    }
    
}

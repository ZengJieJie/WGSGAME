//
//  RealmfeedbkackViewController.swift
//  RealmSpinWorldSlots
//
//  Created by adin on 2024/9/4.
//

import UIKit

class RealmfeedbkackViewController: UIViewController {
    
    @IBOutlet var starButtons: [UIButton]!  // Array of star buttons
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var selectedRating: Int = 0  // To keep track of the selected rating

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarButtons()
    }
    
    private func setupStarButtons() {
        // Set initial state of the star buttons
        for button in starButtons {
            button.setTitle("☆", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            button.tag = starButtons.firstIndex(of: button)! + 1
        }
    }

    @IBAction func starButtonTapped(_ sender: UIButton) {
        selectedRating = sender.tag  // Set the selected rating based on the tapped button
        updateStarSelection()
    }

    private func updateStarSelection() {
        for button in starButtons {
            if button.tag <= selectedRating {
                button.setTitle("★", for: .normal)
            } else {
                button.setTitle("☆", for: .normal)
            }
        }
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let comment = commentTextField.text, !comment.isEmpty
        else{
            showAlert(title: "Info", message: "Please Fill Text Field !")
            return
        }
        // Handle the feedback submission here (e.g., send it to a server or store it locally)
        print("Rating: \(selectedRating), Comment: \(comment )")
        
        // Optionally, show a confirmation or reset the view
        showAlert(title: "Thank You!", message: "Your feedback has been submitted. Rating: \(selectedRating), Comment: \(comment)")
    }

    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }
}






//func feedbackView(_ feedbackView: FeedbackView, didSubmitRating rating: Int, withComment comment: String?) {
//    print("Rating: \(rating), Comment: \(comment ?? "No comment")")
//    // Handle the feedback submission here (e.g., send it to a server or store it locally)
//}

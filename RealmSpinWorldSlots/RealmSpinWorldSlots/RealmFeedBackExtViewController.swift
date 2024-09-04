//
//  RealmFeedBackExtViewController.swift
//  RealmSpinWorldSlots
//
//  Created by adin on 2024/9/4.
//

import UIKit

protocol RealmFeedBackExtViewControllerDelegate: AnyObject {
    func feedbackView(_ feedbackView: RealmFeedBackExtViewController, didSubmitRating rating: Int, withComment comment: String?)
}

class RealmFeedBackExtViewController: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    weak var delegate: RealmFeedBackExtViewControllerDelegate?
    
    private var starButtons: [UIButton] = []
    private var selectedRating: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Load the nib file and connect outlets
        let nib = UINib(nibName: "FeedbackView", bundle: Bundle(for: RealmFeedBackExtViewController.self))
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
        
        // Set up star buttons
        setupStarButtons()
    }
    
    private func setupStarButtons() {
        for i in 1...5 {
            let button = UIButton(type: .system)
            button.setTitle("☆", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            button.tag = i
            button.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
            starButtons.append(button)
            starStackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Actions
    @objc private func starButtonTapped(_ sender: UIButton) {
        selectedRating = sender.tag
        updateStarSelection()
    }
    
    @objc private func submitButtonTapped() {
        let comment = commentTextField.text
        delegate?.feedbackView(self, didSubmitRating: selectedRating, withComment: comment)
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
}

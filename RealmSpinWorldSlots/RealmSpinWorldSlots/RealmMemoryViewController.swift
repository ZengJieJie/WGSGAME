//
//  RealmMemoryViewController.swift
//  RealmSpinWorldSlots
//
//  Created by adin on 2024/9/4.
//

import UIKit

class RealmMemoryViewController: UIViewController {

    @IBOutlet weak var sequencePickerView: UIPickerView!
    @IBOutlet weak var userPickerView: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet var correctSequenceImage: [UIImageView]!
    @IBOutlet var selectedSequenceImage: [UIImageView]!
    
    var arrImageArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var correctSequence: [Int] = []
    var selectedSequence: [Int] = []
    var timer = Timer()
    var timeLeft: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sequencePickerView.delegate = self
        sequencePickerView.dataSource = self
        userPickerView.delegate = self
        userPickerView.dataSource = self
        
        startButton.setTitle("Start", for: .normal)
        timerLabel.text = "Time Left: \(timeLeft)s"
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if startButton.title(for: .normal) == "Start" || startButton.title(for: .normal) == "Restart" {
            startGame()
        }
    }
    
    func startGame() {
        // Reset game state
        correctSequence.removeAll()
        selectedSequence.removeAll()
        timer.invalidate()
        
        // Reset UI
        startButton.setTitle("Restart", for: .normal)
        timeLeft = 5
        timerLabel.text = "Time Left: \(timeLeft)s"
        
        // Clear previous image views
        clearSequenceImages()
        
        // Generate random sequences for both pickers
        generateRandomSequences()
        
        // Show the sequence in the sequence picker view
        showSequenceInPickerView(sequencePickerView, sequence: correctSequence) {
            // Start timer after showing the sequence
            
        }
        
        // Randomly select in user picker view
        showSequenceInPickerView(userPickerView, sequence: selectedSequence)
        
        // Display sequences in image views
        displaySequencesInImageViews()
    }
    
    func clearSequenceImages() {
        for imageView in correctSequenceImage {
            imageView.image = nil
        }
        for imageView in selectedSequenceImage {
            imageView.image = nil
        }
    }
    
    func generateRandomSequences() {
        self.startTimer()
        for _ in 0..<correctSequenceImage.count {
            let randomIndex = Int.random(in: 0..<arrImageArray.count)
            correctSequence.append(randomIndex)
            
            let randomUserIndex = Int.random(in: 0..<arrImageArray.count)
            selectedSequence.append(randomUserIndex)
        }
        
    }
    
    func showSequenceInPickerView(_ pickerView: UIPickerView, sequence: [Int], completion: (() -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            for (index, row) in sequence.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1.0) {
                    pickerView.selectRow(row, inComponent: 0, animated: true)
                }
            }
            // Complete sequence showing after the last image
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(sequence.count) * 1.0) {
                completion?()
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            timerLabel.text = "Time Left: \(timeLeft)s"
        } else {
            timer.invalidate()
            checkForWin()
        }
    }
    
    func displaySequencesInImageViews() {
        for (index, imageView) in correctSequenceImage.enumerated() {
            let imageName = arrImageArray[correctSequence[index]]
            imageView.image = UIImage(named: imageName)
        }
        
        for (index, imageView) in selectedSequenceImage.enumerated() {
            let imageName = arrImageArray[selectedSequence[index]]
            imageView.image = UIImage(named: imageName)
        }
    }
    
    func checkForWin() {
        var matchCount = 0
        
        for i in 0..<correctSequence.count {
            if correctSequence[i] == selectedSequence[i] {
                matchCount += 1
            }
        }
        
        if matchCount == correctSequence.count {
            showAlert(title: "Congratulations", message: "You matched all images!", iconName: "congratulation")
        } else {
            showAlert(title: "Congratulations", message: "You matched \(matchCount) out of \(correctSequence.count) images.", iconName: "Congratulations")
        }
    }
    
    func showAlert(title: String, message: String, iconName: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Load the image
        if let icon = UIImage(named: iconName) {
            let iconImageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
            iconImageView.image = icon
            alertController.view.addSubview(iconImageView)
        }
        
        // Add the OK action
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.startButton.setTitle("Start", for: .normal)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension RealmMemoryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrImageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView
        
        if let reusedView = view as? UIImageView {
            imageView = reusedView
        } else {
            imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
        }
        
        imageView.image = UIImage(named: arrImageArray[row])
        
        return imageView
    }
}

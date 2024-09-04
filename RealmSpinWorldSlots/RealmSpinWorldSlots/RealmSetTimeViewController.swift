//
//  RealmSetTimeViewController.swift
//  RealmSpinWorldSlots
//
//  Created by adin on 2024/9/4.
//

import UIKit

class RealmSetTimeViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var checkImage: UIImageView!
    
    var arrImageArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var timer = Timer()
    var timeLeft: Int = 5
    var selectedImageIndex: Int = 0
    var pickerRotationTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
       
        setButton.setTitle("Start", for: .normal)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func setAllFunctionWorkTappedButton(_ sender: Any) {
        if setButton.title(for: .normal) == "Start" || setButton.title(for: .normal) == "Restart" {
            startGame()
        }
    }
    
    func startGame() {
        
        timer.invalidate()
        pickerRotationTimer?.invalidate()
        
        
        setButton.setTitle("Restart", for: .normal)
        
        
        timeLeft = 5
        timerLabel.text = "Time Left: \(timeLeft)s"
        
        
        selectedImageIndex = Int.random(in: 0..<arrImageArray.count)
        checkImage.image = UIImage(named: arrImageArray[selectedImageIndex])
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startPickerViewRotation()
        
        pickerView.selectRow(Int.random(in: 0..<arrImageArray.count), inComponent: 0, animated: true)
    }
    
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            timerLabel.text = "Time Left: \(timeLeft)s"
        } else {
            timer.invalidate()
            stopPickerViewRotation()
            checkForMatch()
        }
    }
    
    func checkForMatch() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        
        if selectedRow == selectedImageIndex {
            showAlert(title: "Congratulations", message: "You matched the image!", iconName: "congratulation")
        } else {
            showAlert(title: "Lose", message: "The images did not match.", iconName: "lose")
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
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }

    
    func restartGame() {
        startGame()
    }
    
    func startPickerViewRotation() {
        pickerRotationTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 1...3)), repeats: false) { timer in
            // Select a random row in the picker view
            let randomRow = Int.random(in: 0..<self.arrImageArray.count)
            self.pickerView.selectRow(randomRow, inComponent: 0, animated: true)
            
            // Start a new rotation with a different random interval
            self.startPickerViewRotation()
        }
    }


    
    func stopPickerViewRotation() {
        pickerRotationTimer?.invalidate()
    }
}

extension RealmSetTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrImageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
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

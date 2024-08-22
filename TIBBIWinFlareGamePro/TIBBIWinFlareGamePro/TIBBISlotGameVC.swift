//
//  SlotGameVC.swift
//  Win Flare Game Pro
//
//  Created by FJ on 09/08/24.
//

import UIKit

class TIBBISlotGameVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var imgGif: UIImageView!
    @IBOutlet weak var lblResuilt: UILabel!
    @IBOutlet weak var imgSame: UIImageView!
    
    var images: [String] = [
    
        "7",
        "7o",
        "bar",
        "bomb",
        "luck",
        "tiger",
        "star"
        
    ]
    
    var tokens: Int = 1000{
        didSet{
            
            if tokens <= 0{
                
                playSystemSound(name: "bad")

                let alrt = UIAlertController(title: "TO TOKEN TO PLAY.", message: nil, preferredStyle: .alert)
                
                alrt.addAction(UIAlertAction(title: "GO BACK", style: .destructive, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }))
                
                self.present(alrt, animated: true)
                
            }
            
            tokenLabel.text = "🐞 coin \(tokens)"
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        tokens = 1000
        
        imgGif.image = UIImage.gifImageWithName("dog")
        
    }

    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 4
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return images.count * 1000
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return pickerView.bounds.height/3
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: UIImage(named: images[row % images.count]))
        
        let w = pickerView.bounds.width
        
        imageView.frame.size = CGSize(width: w/6, height: w/6)
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }

    @IBAction func spinButtonPressed(_ sender: UIButton) {
        
        spinButton.isEnabled = false
        
        var lastPosition: [Int] = []
        
        for i in 0..<4 {
            
            let delay = Double(i) * 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                playSystemSound(name: "coin")
                
                let randomRow = Int(arc4random_uniform(UInt32(self.images.count * 1000)))
                
                self.pickerView.selectRow(randomRow, inComponent: i, animated: true)
                
                lastPosition.append(randomRow % self.images.count)
                
                if i == 3 {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        
                        self.spinButton.isEnabled = true
                        
                        self.checkResults(lastPosition)
                        
                    }
                }
            }
        }
    }
    
    func checkResults(_ positions: [Int]) {
        
        let imageCounts = Dictionary(positions.map { ($0, 1) }, uniquingKeysWith: +)
        
        let sortedCounts = imageCounts.sorted(by: { $0.value > $1.value })
        
        if let highestCount = sortedCounts.first {
            
            let imageName = images[highestCount.key]
            self.imgSame.image = UIImage(named: imageName)
            
            switch highestCount.value {
                
            case 4:
                
                self.lblResuilt.text = "Four of a kind:"
                self.tokens += 1000
                playSystemSound(name: "win")
                
            case 3:
                
                self.lblResuilt.text = "Three of a kind:"
                self.tokens += 50
                playSystemSound(name: "happy")
                
            case 2:
                
                self.lblResuilt.text = "Two of a kind:"
                self.tokens += 10
                playSystemSound(name: "restro")
                
            default:
                
                self.lblResuilt.text = "No matching Items"
                self.imgSame.image = nil
                self.tokens -= 10
//                playSystemSound(name: "sad")
            }
            
        } else {
            
            print("No match")
            self.tokens -= 10
            self.imgSame.image = nil
            
        }
        
    }

}

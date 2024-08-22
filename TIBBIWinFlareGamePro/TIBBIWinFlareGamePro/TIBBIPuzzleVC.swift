//
//  PuzzleVC.swift
//  Win Flare Game Pro
//
//  Created by FJ on 09/08/24.
//

import UIKit

class TIBBIPuzzleVC: UIViewController, TIBBIPuzzleGameProto {
    
    @IBOutlet var imgCovers: [UIImageView]!
    
    @IBOutlet weak var imgBg: UIImageView!
    
    @IBOutlet weak var lblScore : UILabel!
    
    var currImg: Data?{
        
        didSet{
            
            UserDefaults.standard.setValue(currImg, forKey: "currImg")
            
            guard let currImg else{
                return
            }
            
            DispatchQueue.main.async {
                self.imgBg.image = UIImage(data: currImg)
            }
            
        }
    }
    
    var score : Int = 0{
        didSet{
            self.lblScore.text = "Score: \(score)"
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        currImg = UserDefaults.standard.data(forKey: "currImg")
        
        if currImg == nil{
            
            getImage()
            
        }
        self.lblScore.text = "Score: 0"
            
        self.showAlert("Tips", "Play Game To Remove Cover From Image")
        
    }
    
    func showAlert(_ title :String,_ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK button tapped")
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnStart(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PuzzleGameVC")as! TIBBIPuzzleGameVC
        
        vc.GameDelegate = self
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getImage(){
        
        URLSession.shared.dataTask(with: URL(string: "https://picsum.photos/1920/1080")!) { data, response, error in
            
            guard let imageData = data else {
                print("No image data received")
                
                return
            }
            
            self.currImg = imageData
            
        }.resume()
        
    }
    
    
    func removeOne() {
        
        playSystemSound(name: "happy")
        
        var id = 0
        
        for i in imgCovers{
            
            id += 1
            
            if id > 7{
                print("DONE")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PuzzleCompVC")as! TIBBIPuzzleCompVC
                    
                    vc.imgData = self.currImg
                    
                    for i in self.imgCovers {
                        i.isHidden = false
                    }
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    self.getImage()
                }
            }
            
            if !i.isHidden{
                
                i.isHidden = true
                return
            }
            
        }
        
    }
    
    func addScore(_ scr : Int) {
        self.score += scr
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

//
//  PuzzleGameVC.swift
//  TIBBIWinFlareGamePro
//
//  Created by FJ on 01/04/24.
//

import UIKit

class TIBBIPuzzleGameVC: UIViewController {
    
    @IBOutlet weak var cv: UICollectionView!
    
    var GameDelegate: TIBBIPuzzleGameProto?
    
    var arrCards: [Int] = []{
        
        didSet{
            
            cv.reloadData()
            
        }
        
    }
    
    var lastCell: PokerGameCell?
    
    var isAllCardSame : Int = 0{
        didSet{
            if isAllCardSame >= 9 {
                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
//                GameDelegate?.removeOne()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cv.delegate = self
        cv.dataSource = self
        genArr()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
//            self.GameDelegate?.removeOne()
//        }
    }
    
    
    func genArr(){
        
        var arrCards: [Int] = []
        
        for _ in (1...9){
            
            let card: Int = (1...4).randomElement()!
            arrCards.append(card)
            arrCards.append(card)
        }
        
        self.arrCards = arrCards.shuffled()
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

extension TIBBIPuzzleGameVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        arrCards.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "PokerGameCell", for: indexPath)as! PokerGameCell
        
        cell.tag = indexPath.item
        
        cell.img.image = UIImage(named: "meray")
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        cell.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
        
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        
        guard let cell = sender.view as? PokerGameCell else {
            return
        }
       
        let options: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
            
            cell.img.image = UIImage(named: "\(self.arrCards[cell.tag])")
            
        }
        
        
        UIView.transition(from: cell.contentView, to: cell.contentView, duration: 1.0, options: options) { _ in
            
            if self.lastCell == cell{
                
                self.lastCell = nil
                cell.img.image = UIImage(named: "meray")
                print("same cell")
                
                
            }else if self.lastCell == nil{
                
                self.lastCell = cell
                self.lastCell?.tag = cell.tag
                
            }else{
                
                if self.arrCards[cell.tag] == self.arrCards[self.lastCell?.tag ?? 0]{
                    
                    //manage same
                    cell.isUserInteractionEnabled = false
                    self.lastCell?.isUserInteractionEnabled = false
                    self.lastCell = nil
                    self.isAllCardSame += 1
                    self.GameDelegate?.addScore(5)
                    print("matched")
                    playSystemSound(name: "coin")
                    
                }else{
                    
                    //manage wrong
                    cell.img.image = UIImage(named: "meray")
                    self.lastCell?.img.image = UIImage(named: "meray")
                    self.lastCell = nil
                    self.GameDelegate?.addScore(-1)
                    print("Wrong")
                    playSystemSound(name: "restro")
                    
                }
                
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: cv.bounds.width/6, height: cv.bounds.height/3)
        
    }
    
}

class PokerGameCell: UICollectionViewCell{
    
    @IBOutlet weak var img: UIImageView!
    
    var isMatched = false
    var imgId = 0
    
}

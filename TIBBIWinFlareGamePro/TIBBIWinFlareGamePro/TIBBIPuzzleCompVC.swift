//
//  PuzzleCompVC.swift
//  TIBBIWinFlareGamePro
//
//  Created by FJ on 01/04/24.
//

import UIKit

class TIBBIPuzzleCompVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var tbl: UITableView!
    
    @IBOutlet var viewCongo: UIVisualEffectView!
    
    @IBOutlet weak var imgCongo: UIImageView!
    
    
    var imgData: Data?
    
    var arrImgList: [Data] = []{
        
        didSet{
            
            UserDefaults.standard.setValue(arrImgList, forKey: "arrImgList")
            tbl.reloadData()
            
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
            return .landscape
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let arr = UserDefaults.standard.array(forKey: "arrImgList")as? [Data]{
            
            arrImgList = arr
            
        }
        
        tbl.delegate = self
        tbl.dataSource = self
        
        guard let imgData else{
            return
        }
        
        arrImgList.append(imgData)
        
        viewCongo.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        viewCongo.center = view.center
        
        view.addSubview(viewCongo)
        
        imgCongo.image = UIImage(data: imgData)
        img.image = UIImage(data: imgData)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
            
            playSystemSound(name: "win")
            
            self.viewCongo.transform = CGAffineTransform(translationX: 0, y: 0).scaledBy(x: 1.3, y: 1.3)
            
        }) { (_) in
            
//            self.viewCongo.removeFromSuperview()
            
        }
        
    }
    

    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnCloseImg(_ sender: Any) {
        
        closeCongo()
        
    }
    
    func closeCongo(){
        
        viewCongo.removeFromSuperview()
        
    }
    
    @IBAction func btnShare(_ sender: Any) {
        
        guard let img = img.image else{
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    
}

extension TIBBIPuzzleCompVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        arrImgList.isEmpty ? 1 : arrImgList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath)as! imgCell
        if arrImgList.isEmpty{
            cell.img.image = UIImage(named: "x")
            return cell
        }
        cell.img.image = UIImage(data: arrImgList[indexPath.row])
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        80
//        
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if arrImgList.isEmpty{
            return
        }
        
        img.image = UIImage(data: arrImgList[indexPath.item])
        
    }
}


class imgCell: UITableViewCell{
    
    @IBOutlet weak var img: UIImageView!
    
}

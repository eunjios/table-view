//
//  DetailViewController.swift
//  Table View
//
//  Created by 이은지 on 2021/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    var index: Int?
//    var listTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.layer.zPosition = -1
        
        if let index = self.index {
            let img = UIImage(named: "\(index).jpg")
            detailImage.image = img
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}



//
//  DetailViewController.swift
//  Table View
//
//  Created by 이은지 on 2021/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - FilmInfo
    // > FilmInfo 만들자
    
    // View
    // - detailImage
    // > view 들은 viewModel 을 통해서 구성 되어야 한다..
    
    // ViewModel
    // - FilmViewModel
    // > 뷰 레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 --> FilmInfo
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailDateLabel: UILabel!
    
    var index: Int?
    var filmInfo: FilmInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.layer.zPosition = -1
        detailDateLabel.layer.zPosition = 2
        
        updateUI()
    }
    
    func updateUI() {
        if let filmInfo = self.filmInfo, let index = self.index {
            let img = UIImage(named: "\(index).jpg")
            detailImage.image = img
            detailDateLabel.text = "\(filmInfo.date)"
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}



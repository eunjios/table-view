//
//  FilmViewController.swift
//  Table View
//
//  Created by 이은지 on 2021/01/23.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cameraList = ["Leica Mini Zoom", "Leica Mini Zoom", "Leica Mini Zoom", "Leica Mini Zoom", "Konica Big Mini", "Fuji Simple Ace"]
    let filmList = ["Fuji C200", "Fuji C200", "Kodak Gold 200", "Kodak Gold 200", "Agfa Vista 200", "embedded film"]
    let filmLabList = ["Elly camera", "Elly camera", "Haedanghwa", "Mangwoosamlim", "Mangwoosamlim", "Mangwoosamlim"]
    let dateList = ["October, 2020", "August, 2020", "January, 2020", "December, 2019", "August, 2019", "January, 2019"]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터 넘겨준다.
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.index = index
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // UITableViewDataSource ---> 어떤 테이블 뷰를 만들지
    // ---> 이 코드만 작성하고 빌드해도 테이블 뷰 안 나타남
    // 따라서 Table view 와 view controller 에 ctrl + drag 한 후 delegate, datasource 선택해주어야 함!!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameraList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // list cell 로 캐스팅해서 있는 경우에 return cell, 그렇지 않은 경우엔 return UITableViewCell()
        // Table view cell 의 Identifier 와 동일하게 적어줌
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(indexPath.row).jpg")
        cell.imgView.image = img
        cell.titleLabel.text = "\(cameraList[indexPath.row]) + \(filmList[indexPath.row]) developed by \(filmLabList[indexPath.row])"
        cell.nameLable.text = "Eunji Lee"
        cell.dateLabel.text = dateList[indexPath.row]
        return cell
    }
    
    // UITableViewDelegate ---> 클릭 했을 때 어떻게 반응할거냐?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---> \(indexPath.row)")      // table view cell 눌렀을 때 그것의 row 를 print
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

// custom cell
class ListCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
}

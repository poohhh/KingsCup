//
//  HowToPlayViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/10/21.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func setCardImage(row: Int) -> UIImage? {
        if row == 0 {
            guard let img = UIImage(named: "crowns") else { return nil}
            return img
        }
        if row < 10 {
            guard let img = UIImage(named: "number\(row + 1)") else { return nil}
            return img
        } else {
            guard let img = UIImage(named: "card\(Rule.type[row-10])") else { return nil}
            return img
        }
        
    }
    
    let list = Rule.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
    }
    

}


extension HowToPlayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HowToPlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let text = list[indexPath.row]
        if let imageView = cell.viewWithTag(100) as? UIImageView {
            imageView.image = setCardImage(row: indexPath.row)
        }
        
        if let label = cell.viewWithTag(200) as? UILabel {
            label.text = text
        }
        
        return cell
    }
    
    
}

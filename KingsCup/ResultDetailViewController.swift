//
//  ResultDetailViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/12/21.
//

import UIKit

class ResultDetailViewController: UIViewController {
    
    @IBOutlet weak var cardDescription: UITextView!
    
    @IBOutlet weak var cardName: UILabel!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBAction func nextPlayer(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        cardImage.image = UIImage(named: result)
        result = result.replacingOccurrences(of: "H", with: " ♥️")
        result = result.replacingOccurrences(of: "S", with: " ♠️")
        result = result.replacingOccurrences(of: "C", with: " ♣️")
        result = result.replacingOccurrences(of: "D", with: " ♦️")
        
        cardName.text = result
        
        
        for num in 2...10 {
            if result.contains("\(num)") {
                cardDescription.text = Rule.list[num-1]
                break
            }
        }
        
        for (idx, type) in Rule.type.enumerated() {
            if result.contains(type) {
                cardDescription.text = Rule.list[idx+10]
                break
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardImage.center.y = self.view.frame.height + 40
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            self.cardImage.center.y = self.view.frame.height / 2
        }, completion: nil)
    }
}


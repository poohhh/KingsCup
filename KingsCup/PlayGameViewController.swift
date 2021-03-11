//
//  PlayGameViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/11/21.
//

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var users = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchToImage))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        print(users)
    }
    
    @objc func touchToImage() {
        print("hello")
    }

    

}

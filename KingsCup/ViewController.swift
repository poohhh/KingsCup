//
//  ViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var howToPlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stackView.center.x = self.view.frame.width + 30
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: [], animations: {
            self.stackView.center.x = self.view.frame.width / 2
        }, completion: nil)
    }

}


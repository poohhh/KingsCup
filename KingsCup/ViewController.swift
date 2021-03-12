//
//  ViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    
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
        
        playButton.center.x = self.view.frame.width + 30
        howToPlayButton.center.x = self.view.frame.width + 30
        imageView.center.x = self.view.frame.width + 30
        nameLabel.center.x = self.view.frame.width + 30
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            self.imageView.center.x = self.view.frame.width / 2
            self.nameLabel.center.x = self.view.frame.width / 2
            self.playButton.center.x = self.view.frame.width / 2
            self.howToPlayButton.center.x = self.view.frame.width / 2
        }, completion: nil)
    }

}


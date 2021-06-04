//
//  PlayGameViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/11/21.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    let images = [UIImage(named: "gray")!,
        UIImage(named: "red")!,
        UIImage(named: "yellow")!,
        UIImage(named: "green")!,
        UIImage(named: "blue")!,
        UIImage(named: "purple")!
    ]

    @IBOutlet weak var imageView: UIImageView!
    
    
    var users = [String]()
    var cards = [String]()
    
    var array = [Int]()
    
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playedCardNum: UILabel!
    
    @IBOutlet weak var remainCardNum: UILabel!
    
    
    var now = 0
    
    @IBOutlet weak var nowStack: UIStackView!
    
    @IBOutlet weak var remainStack: UIStackView!
    
    var cardK_count = 0
    var card = ""
    var iscardK = false
    
    func shuffleCard() {
        for i in 0...51 {
            array.append(i)
        }
        
        for i in 1...10 {
            if i == 1 {
                cards.append("AC")
                cards.append("AD")
                cards.append("AH")
                cards.append("AS")
            } else {
                cards.append("\(i)C")
                cards.append("\(i)D")
                cards.append("\(i)H")
                cards.append("\(i)S")
            }
        }
        
        for c in ["J", "Q", "K"] {
            cards.append("\(c)C")
            cards.append("\(c)D")
            cards.append("\(c)H")
            cards.append("\(c)S")
        }
        
        array.shuffle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultDetailViewController = segue.destination as? ResultDetailViewController else { return }
        
        if now - 1 >= 0 && now - 1 < array.count {
            card = self.cards[array[now-1]]
            resultDetailViewController.result = card
        }
        
        if card.hasPrefix("K") {
            cardK_count += 1
            print(cardK_count)
            iscardK = true
        } else {
            iscardK = false
        }
        
        imageView.stopAnimating()
    }
    
    @objc func exitAction(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Exit", message: "처음으로 돌아가시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        })
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func backAction(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Reset", message: "Player를 재설정하시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exitButton = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(self.exitAction(sender:)))
        
        self.navigationItem.rightBarButtonItem = exitButton
        
        let backButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(self.backAction(sender:)))

        self.navigationItem.leftBarButtonItem = backButton
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchToImage))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        
        nowStack.layer.cornerRadius = nowStack.frame.height * 0.30
        remainStack.layer.cornerRadius = remainStack.frame.height * 0.30
        
        playerName.text = "\(users[0])"
        
        playedCardNum.text = "\(now)"
        remainCardNum.text = "\(52 - now)"
        
        
        imageView.animationImages = images
        imageView.animationDuration = 0.8
        imageView.animationRepeatCount = 0
        
        shuffleCard()
        
    }
    
    @objc func touchToImage() {
        now += 1
        
        if now == array.count + 1{
            let alert = UIAlertController(title: "End Game", message: "처음으로 돌아가시겠습니까?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            }))

            self.present(alert, animated: true, completion: nil)
        }
        
        if now <= 52 {
            performSegue(withIdentifier: "showDetail", sender: nil)
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        imageView.startAnimating()
        
        if iscardK {
            if cardK_count < 4 {
                let alert = UIAlertController(title: "King 카드가 나왔네요!", message: "\(cardK_count)번째 킹스컵을 제조하세요!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
                })
                
                self.present(alert, animated: true, completion: nil)
            } else if cardK_count == 4 {
                let alert = UIAlertController(title: "킹스컵 당첨!", message: "킹스컵 걸렸습니다~!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
                })
                
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        playerName.text = "\(users[now % users.count])"
        
        if now <= 52 {
            playedCardNum.text = "\(now)"
            remainCardNum.text = "\(52 - now)"
        }
    }
}



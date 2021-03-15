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
        
        if result.contains("A") {
            cardDescription.text = "다 같이 파도타기 하면서 👏 ~"
        } else if result.contains("2") {
            cardDescription.text = "카드를 뽑은 사람이 다른 한 명 지목! 지목당한 사람 👏"
        } else if result.contains("3") {
            cardDescription.text = "셀프 👏 뽑은 사람이 👏"
        } else if result.contains("4") {
            cardDescription.text = "모든 여자들 👏~!"
        } else if result.contains("5") {
            cardDescription.text = "카드 뽑으면 눈치게임 시작! 맨 마지막에 외친 사람👏"
        } else if result.contains("6") {
            cardDescription.text = "모든 남자들 👏~! "
        } else if result.contains("7") {
            cardDescription.text = "하늘 위로 손을 뻗어주세요!! (맨 마지막에 올린 사람 👏~)"
        } else if result.contains("8") {
            cardDescription.text = "내 짝꿍을 뽑아줘!(내가 👏 짝꿍도 👏~)"
        } else if result.contains("9") {
            cardDescription.text = "라임에 맞춰 단어 나열하기! 막힌 사람 👏~ (ex. 초성게임)"
        } else if result.contains("10") {
            cardDescription.text = "같은 카테고리 단어 나열하기 게임시작! (ex. 카드 뽑은 사람이 먼저시작! '사과' 외치면 포도,바나나 나열)"
        } else if result.contains("J") {
            cardDescription.text = "내 맘대로 한가지 룰을 만들자! (ex. 일어나지 않기, 웃지 않기..) 룰을 없앨 수도 있다!"
        } else if result.contains("Q") {
            cardDescription.text = "퀸에게 응답하라! 퀸의 질문에 대답하지 못하면 👏!(다음 퀸이 나오기 전까지)"
        } else if result.contains("K") {
            cardDescription.text = "킹스컵을 만들자! 4번째 킹은 3명이 만든 킹스컵 가지고 혼자서 👏~"
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


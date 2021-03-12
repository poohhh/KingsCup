//
//  HowToPlayViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/10/21.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    let rule = ["J ♥️", "Q ♣️", "K ♦️", "A ♠️"]
    
    let mainImg = UIImage(named: "kingscup1")
    let ruleImg = UIImage(named: "kingscup_rule")
    
    var numberImgs = [UIImage]()
    
    func addNumberCardImage() {
        for n in (2...10) {
            if let img = UIImage(named: "number\(n)") {
                numberImgs.append(img)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "\n숫자 2 : 카드를 뽑은 사람이 다른 한 명 지목! \n\n숫자 3 : 뽑은 사람이 자기 컵 마셔! \n\n숫자 4 : 모든 여자들 마셔~! \n\n숫자 5 : 카드 뽑으면 눈치게임 시작!\n\n숫자 6 : 모든 남자들 마셔~! \n\n숫자 7 : 하늘 위로 손을 뻗어주세요!!(맨 마지막에 올린 사람 마셔~)\n\n숫자 8 : 내 짝꿍을 뽑아줘!(내가 마시면 짝꿍도 마셔~) \n\n숫자 9 : 라임에 맞춰 단어 나열하기! 막힌 사람 마시기~ (ex. 초성게임) \n\n숫자 10: 같은 카테고리 단어 나열하기 게임시작! (ex. 카드 뽑은 사람이 먼저시작! '사과' 외치면 포도,바나나 나열) \n\nJ ♥️ : 내 맘대로 한가지 룰을 만들자! (ex. 일어나지 않기, 웃지 않기..) 룰을 없앨 수도 있다! \n\nQ ♣️: 퀸을 질문쟁이 나에게 모두 응답하라! \n\nK ♦️ : 킹스컵을 제조하자! 4번째 킹은 3명의 킹들이 제조한 킹스컵 혼자서 다마셔~\n\nA ♠️ : 파도타기하면서 다마셔 ~"
        
        // TODO: 폰트 전체 사이즈 지정하기
        
        let fontSize = UIFont.boldSystemFont(ofSize: 20)
        let attributedStr = NSMutableAttributedString(string: textView.text)
        
//        addNumberCardImage()
        
        // TODO: 화면돌렸을때 이미지 어떻게 할건지 정하기
        
        let text = textView.text
        
        for n in (2...10) {
            attributedStr.addAttribute(.font, value: fontSize, range: (text as! NSString).range(of: "숫자 \(n)"))
            attributedStr.addAttribute(.foregroundColor, value: UIColor.systemRed, range: (text as! NSString).range(of: "숫자 \(n)"))
//            let attachment = NSTextAttachment()
//            attachment.image = numberImgs[n-2]
            
        }
        
        for r in rule {
            attributedStr.addAttribute(.font, value: fontSize, range: (text as! NSString).range(of: r))
        }
        
        textView.attributedText = attributedStr


        let attachment = NSTextAttachment()
        attachment.image = ruleImg
        let attrStr2 = NSAttributedString(attachment: attachment)
        textView.textStorage.insert(attrStr2, at: 0)
    }
    

    

}

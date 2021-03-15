//
//  HowToPlayViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/10/21.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    let rule = ["J ", "Q ", "K ", "A "]
    
//    let mainImg = UIImage(named: "back_cards-7")
//    let ruleImg = UIImage(named: "kingscup_rule")
    
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
        
        textView.text = "친구들과 재밌는 카드게임을 시작해보세요! 걸린 사람은 박수를 쳐야 합니다👏 👏 \n\n숫자 2 : 카드를 뽑은 사람이 다른 한 명 지목! 지목당한 사람 👏 \n\n숫자 3 : 셀프 👏 뽑은 사람이 👏 \n\n숫자 4 : 모든 여자들 👏~! \n\n숫자 5 : 카드 뽑으면 눈치게임 시작! 맨 마지막에 외친 사람👏\n\n숫자 6 : 모든 남자들 👏~! \n\n숫자 7 : 하늘 위로 손을 뻗어주세요!! (맨 마지막에 올린 사람 👏~)\n\n숫자 8 : 내 짝꿍을 뽑아줘!(내가 👏 짝꿍도 👏~) \n\n숫자 9 : 라임에 맞춰 단어 나열하기! 막힌 사람 👏~ (ex. 초성게임) \n\n숫자 10: 같은 카테고리 단어 나열하기 게임시작! (ex. 카드 뽑은 사람이 먼저시작! '사과' 외치면 포도,바나나 나열) \n\n\nJ : 내 맘대로 한가지 룰을 만들자! (ex. 일어나지 않기, 웃지 않기..) 룰을 없앨 수도 있다! \n\nQ : 퀸에게 응답하라! 퀸의 질문에 대답하지 못하면 👏!(다음 퀸이 나오기 전까지)\n\nK : 킹스컵을 만들자! 4번째 킹은 3명이 만든 킹스컵 가지고 혼자서 👏~\n\nA : 다 같이 파도타기 하면서 👏 ~"
        
        // TODO: 폰트 전체 사이즈 지정하기
        let initFont = UIFont.systemFont(ofSize: 16.0)
        
        let fontSize = UIFont.boldSystemFont(ofSize: 20)
        let attributedStr = NSMutableAttributedString(string: textView.text)
        
//        addNumberCardImage()
        
        // TODO: 화면돌렸을때 이미지 어떻게 할건지 정하기
        
        let text = textView.text
        
        attributedStr.addAttribute(.font, value: initFont, range: (text as! NSString).range(of: "친구들과 재밌는 카드게임을 시작해보세요! 걸린 사람은 박수를 쳐야 합니다👏 👏 "))
        for n in (2...10) {
            attributedStr.addAttribute(.font, value: fontSize, range: (text as! NSString).range(of: "숫자 \(n)"))
            attributedStr.addAttribute(.foregroundColor, value: UIColor.black, range: (text as! NSString).range(of: "숫자 \(n)"))
//            let attachment = NSTextAttachment()
//            attachment.image = numberImgs[n-2]
//            let attrStr = NSAttributedString(attachment: attachment)
//            textView.textStorage.insert(attrStr, at: n)
            
        }
        
        for r in rule {
            attributedStr.addAttribute(.font, value: fontSize, range: (text as! NSString).range(of: r))
        }
        
        textView.attributedText = attributedStr


//        let attachment = NSTextAttachment()
//        attachment.image = mainImg
//        let attrStr2 = NSAttributedString(attachment: attachment)
//        textView.textStorage.insert(attrStr2, at: 0)
    }
    

    

}

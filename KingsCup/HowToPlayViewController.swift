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
    
    let list = [
        "친구들과 재밌는 카드게임을 시작해보세요! 걸린 사람은 벌칙입니다!",
        "카드를 뽑은 사람이 다른 한 명 지목! 지목당한 사람 당첨",
        "셀프 당첨! 뽑은 사람이 당첨",
        "모든 여자들 🙋‍♀️ 당첨~!",
        "카드 뽑으면 눈치게임 시작! 맨 마지막에 외친 사람 당첨!",
        "모든 남자들 🙋‍♂️ 당첨~!",
        "하늘 위로 손을 뻗어주세요!! (맨 마지막에 올린 사람 당첨~)",
        "내 짝꿍을 뽑아줘!(내가 당첨되면 짝꿍도 당첨~)",
        "라임에 맞춰 단어 나열하기! 막힌 사람 당첨~ (ex. 초성게임)",
        "같은 카테고리 단어 나열하기 게임시작! (ex. 카드 뽑은 사람이 먼저시작! '사과' 외치면 포도, 바나나 나열)",
        "내 맘대로 한가지 룰을 만들자! (ex. 일어나지 않기, 웃지 않기..) 룰을 없앨 수도 있다!",
        "퀸에게 응답하라! 퀸의 질문에 대답하지 못하면 당첨!(다음 퀸이 나오기 전까지)",
        "킹스컵을 만들자! 4번째 킹은 3명이 만든 킹스컵을 혼자서 당첨~",
        "모두 당첨! 다 같이 파도타기 하면서 벌칙 하기~"
    ]
    
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

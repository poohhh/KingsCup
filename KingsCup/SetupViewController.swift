//
//  SetupViewController.swift
//  KingsCup
//
//  Created by Nayomi on 3/11/21.
//

import UIKit

class SetupViewController: UIViewController {
    
    
    var users = ["Player1", "Player2", "Player3", "Player4"]
    
    
    @IBOutlet weak var playerTableView: UITableView!
    
    @IBAction func valueChanged(_ sender: UITextField) {
        let contentView = sender.superview
        let cell = contentView?.superview as! UITableViewCell
        
        if let indexPath = playerTableView.indexPath(for: cell) {
            if let text = sender.text, text.count > 0 {
                users[indexPath.row] = text
            }
        }
    }
    
    
    @IBAction func addPlayer(_ sender: UIButton) {
        users.append("Player\(users.count + 1)")
        
        playerTableView.reloadData()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        if users.count == 0 {
            let alert = UIAlertController(title: "", message: "최소한 한 명 이상의 플레이어가 있어야 합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                
            }))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "play", sender: nil)
            
        }
        
    }
    
    
    @IBAction func removePlayer(_ sender: UIButton) {
        let contentView = sender.superview
        let cell = contentView?.superview as! UITableViewCell
        
        if let indexPath = playerTableView.indexPath(for: cell) {
            users.remove(at: indexPath.row)
            playerTableView.reloadData()
        }
    }
    
    
    func delete(at indexPath: IndexPath) {
        users.remove(at: indexPath.row)
        playerTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 데이터를 전달한 뷰 컨트롤러가 존재하는 지 확인
        guard let playGameViewController = segue.destination as? PlayGameViewController else { return }
        
        // 대상 뷰 컨트롤러가 존재한다면 데이터를 전달한다.
        playGameViewController.users = self.users
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}


extension SetupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        let target = users[indexPath.row]
        
        if let playerName = cell.viewWithTag(100) as? UITextField {
            playerName.text = target
        }
        
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        return cell
    }

}

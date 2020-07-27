//
//  DiceViewController.swift
//  Code
//
//  Created by guowei on 2020/7/25.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var PlayBtn: UIButton!
    @IBOutlet weak var ScoreImage: UIImageView!
    @IBOutlet weak var ScoreImage2: UIImageView!
    @IBOutlet weak var ScoreImage3: UIImageView!
    
    @IBOutlet weak var CountLabel: UILabel!
    var Diceimage=["perspective-dice-one","perspective-dice-two","perspective-dice-three","perspective-dice-four","perspective-dice-five","perspective-dice-six"]
    var timer=Timer()
    var EnemyDice=0
    var YourDice=0
    var Score=0
    var countTime=UserDefaults().double(forKey:"GuessTime")
    var DiceCountTime=0.0
    var GuessTimer=0.0
    var DiceStoptime=0.0
    
    @IBOutlet weak var YourDiceImage: UIImageView!
    @IBOutlet weak var EnemyDiceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      PlayBtn.layer.cornerRadius = 10
      PlayBtn.layer.borderWidth = 1.5
      PlayBtn.layer.borderColor = UIColor.white.cgColor
      timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(runTimer) , userInfo: nil, repeats: true)
      YourDiceImage.image=UIImage(named: Diceimage[YourDice])
      EnemyDiceImage.image=UIImage(named: Diceimage[EnemyDice])
      CountLabel.text=String(format: "%.1f", countTime)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PressPlayBtn(_ sender: UIButton) {
      ChangeDiceImage()
     
        if YourDice>EnemyDice{
            Score+=1
        }
        if YourDice<EnemyDice{
            Score-=1
        }
        switch Score {
        case 1:
            ScoreImage.isHidden=false
            ScoreImage2.isHidden=true
            ScoreImage3.isHidden=true
        case 2:
            ScoreImage.isHidden=false
            ScoreImage2.isHidden=false
            ScoreImage3.isHidden=true
        case 3:
            ScoreImage.isHidden=false
            ScoreImage2.isHidden=false
            ScoreImage3.isHidden=false
            GotoNextVC()
            
        default:
            ScoreImage.isHidden=true
            ScoreImage2.isHidden=true
            ScoreImage3.isHidden=true
        }
        if Score<1{
            Score=0
        }
        
    }
    func ChangeDiceImage(){
        EnemyDice=Int.random(in: 0...5)
        YourDice=Int.random(in: 0...5)
        YourDiceImage.image=UIImage(named: Diceimage[YourDice])
        EnemyDiceImage.image=UIImage(named: Diceimage[EnemyDice])
    }
     func GotoNextVC(){
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let controller = storyboard.instantiateViewController(withIdentifier: "ResultViewController")
           present(controller, animated: true, completion: nil)
           if self.timer != nil {
           self.timer.invalidate()
           DiceStoptime=countTime
           UserDefaults().setValue(DiceStoptime, forKey: "DiceStopTime")//存数据
           UserDefaults().setValue(DiceCountTime, forKey: "DiceCountTime")
           
        }
       }
    
    @objc func runTimer(){
             DiceCountTime+=0.1
             countTime+=0.1
             CountLabel.text = String(format: "%.1f", countTime)
         }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

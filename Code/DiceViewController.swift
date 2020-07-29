//
//  DiceViewController.swift
//  Code
//
//  Created by guowei on 2020/7/25.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit
import Lottie

class DiceViewController: UIViewController {

    @IBOutlet weak var PlayBtn: UIButton!
    @IBOutlet weak var ScoreImage: UIImageView!
    @IBOutlet weak var ScoreImage2: UIImageView!
    @IBOutlet weak var ScoreImage3: UIImageView!
    
    @IBOutlet weak var yourDiceView: UIView!
    @IBOutlet weak var EmDiceView: UIView!
    
    
    @IBOutlet weak var CountLabel: UILabel!
    
    var Diceimage=["perspective-dice-one","perspective-dice-two","perspective-dice-three","perspective-dice-four","perspective-dice-five","perspective-dice-six"]
    
    var DiceJSONArray=["Dice1","Dice2","Dice3","Dice4","Dice5","Dice6"]//將要讀的動畫存入DiceJSON
    
    var timer=Timer()
    var EnemyDice=0
    var YourDice=0
    var Score=0
    var countTime=UserDefaults().double(forKey:"GuessTime")
    var DiceCountTime=0.0
    var GuessTimer=0.0
    var DiceStoptime=0.0
    
    let animationView=AnimationView()
    let animationView2=AnimationView()
    
    @IBOutlet weak var YourDiceImage: UIImageView!
    @IBOutlet weak var EnemyDiceImage: UIImageView!
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
      PlayBtn.layer.cornerRadius = 10
      PlayBtn.layer.borderWidth = 1.5
      PlayBtn.layer.borderColor = UIColor.white.cgColor
      timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(runTimer) , userInfo: nil, repeats: true)
//      YourDiceImage.image=UIImage(named: Diceimage[YourDice])
//      EnemyDiceImage.image=UIImage(named: Diceimage[EnemyDice])
      CountLabel.text=String(format: "%.1f", countTime)
        
        
      animationView.frame=yourDiceView.bounds
      animationView2.frame=EmDiceView.bounds
      animationView.animation=Animation.named("\(DiceJSONArray[0])")
      animationView2.animation=Animation.named("\(DiceJSONArray[1])")
      animationView.currentTime=3 //設定動畫初始畫面
      animationView2.currentTime=3 //設定動畫初始畫面
      yourDiceView.addSubview(animationView)
      EmDiceView.addSubview(animationView2)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PressPlayBtn(_ sender: UIButton) {
      ChangeDiceImage()
      
       ChangeScore()
     
        
    }
    
    func ChangeScore(){
        
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
        EnemyDice=Int.random(in: 0...5)//取亂數0-5
        YourDice=Int.random(in: 0...5)

        animationView.frame=yourDiceView.bounds//設定骰子動畫大小
        animationView2.frame=EmDiceView.bounds
        
        animationView.animation=Animation.named("\(DiceJSONArray[YourDice])")//設定我方骰子要顯示的動畫是
        animationView2.animation=Animation.named("\(DiceJSONArray[EnemyDice])")//設定敵方骰子要顯示的動畫是
        
        animationView.contentMode = .scaleAspectFill//設定骰子動畫呈現方式
        animationView2.contentMode = .scaleAspectFill
        
        animationView.loopMode = .playOnce //設定骰子動畫模式這邊設定只跑一次
        
        animationView.play()//執行骰子動畫
        animationView2.play()
        
        animationView2.animationSpeed=3//修改骰子動畫的速度
        animationView.animationSpeed=3 //修改骰子動畫的速度
        
        yourDiceView.addSubview(animationView) //將動畫添加到view上顯示
        EmDiceView.addSubview(animationView2)
        
    }
    
    //        YourDiceImage.image=UIImage(named: Diceimage[YourDice])
          //        EnemyDiceImage.image=UIImage(named: Diceimage[EnemyDice])
     func GotoNextVC(){
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let controller = storyboard.instantiateViewController(withIdentifier: "ResultViewController")
           present(controller, animated: true, completion: nil)
           if self.timer != nil {
           self.timer.invalidate()
           DiceStoptime=countTime
           UserDefaults().setValue(DiceStoptime, forKey: "DiceTime")//存数据
           
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

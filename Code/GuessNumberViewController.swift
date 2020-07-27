//
//  ViewController.swift
//  Code
//
//  Created by guowei on 2020/7/25.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class GuessNumberViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var FristPasswordView: UIImageView!
    
    @IBOutlet weak var SecondPasswordView: UIImageView!
    
    @IBOutlet weak var ThirdPasswordView: UIImageView!
    
    @IBOutlet weak var FourthPasswordView: UIImageView!
    
    var timer=Timer()
    
    var stoptime=0.0
    
    var isTheTimerRunning=false
    
    var counter=0.0
    
   
    var TypeWord=""
   
    var isPlaying = false
    
    var Password="0710"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(runTimer) , userInfo: nil, repeats: true)
        
        
        
    }
    
    @IBAction func TypePasswordBtn(_ sender: UIButton) {
        
        if let InputPass=sender.titleLabel?.text,TypeWord.count<4{
            TypeWord.append(InputPass)
            print(TypeWord)
            PasswordImage()
        }
    }
    
    @IBAction func Delte(_ sender: UIButton) {
        
        if TypeWord.count >= 1 {
           TypeWord=String(TypeWord.dropLast(1))
            print(TypeWord)
       
        }
        PasswordImage()
    }
    
    func CheckPassword(){
        if TypeWord == Password{
            ClearPassword()
            GotoNextVC()
            
            if self.timer != nil {
                  self.timer.invalidate()
                  stoptime=counter
                  print(stoptime)
                  UserDefaults().setValue(stoptime, forKey: "GuessTime")//存数据
               }
        }
        else{
            let alert = UIAlertController(title: "Wrong!", message: "Wrong Answer!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: ClearPassword)
        }
        
    }
    
    func PasswordImage(){
        switch TypeWord.count {
        case 1:
            FristPasswordView.isHighlighted=true
            SecondPasswordView.isHighlighted=false
            ThirdPasswordView.isHighlighted=false
            FourthPasswordView.isHighlighted=false
        case 2:
            FristPasswordView.isHighlighted=true
            SecondPasswordView.isHighlighted=true
            ThirdPasswordView.isHighlighted=false
            FourthPasswordView.isHighlighted=false
        case 3:
            FristPasswordView.isHighlighted=true
            SecondPasswordView.isHighlighted=true
            ThirdPasswordView.isHighlighted=true
            FourthPasswordView.isHighlighted=false
        case 4:
            FristPasswordView.isHighlighted=true
            SecondPasswordView.isHighlighted=true
            ThirdPasswordView.isHighlighted=true
            FourthPasswordView.isHighlighted=true
            CheckPassword()
            
            
        default:
            FristPasswordView.isHighlighted=false
            SecondPasswordView.isHighlighted=false
            ThirdPasswordView.isHighlighted=false
            FourthPasswordView.isHighlighted=false
        }
    }
    func ClearPassword(){
       FristPasswordView.isHighlighted=false
       SecondPasswordView.isHighlighted=false
       ThirdPasswordView.isHighlighted=false
       FourthPasswordView.isHighlighted=false
       TypeWord = ""
    }
    @objc func runTimer(){
           counter+=0.1
           timeLabel.text = String(format: "%.1f", counter)
       }
    
    func GotoNextVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DiceViewController")
        
        present(controller, animated: true, completion: nil)
        
    }

   
}


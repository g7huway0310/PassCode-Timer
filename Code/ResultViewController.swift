//
//  ResultViewController.swift
//  Code
//
//  Created by guowei on 2020/7/26.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    

    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var DiceLabel: UILabel!
    var datas=0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        TimeLabel.text = String(format: "%.1f", UserDefaults().double(forKey:"GuessTime"))
        DiceLabel.text = String(format: "%.1f", UserDefaults().double(forKey:"DiceCountTime"))
        
        let total=UserDefaults().double(forKey:"DiceCountTime")+UserDefaults().double(forKey:"GuessTime")
        TotalLabel.text = String(format: "%.1f", total)
        
        
        // Do any additional setup after loading the view.
    }
    

}
    
    

    /*
    // MARK: - Navigat// In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

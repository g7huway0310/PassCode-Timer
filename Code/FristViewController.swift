//
//  FristViewController.swift
//  Code
//
//  Created by guowei on 2020/7/25.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class FristViewController: UIViewController {
    
    @IBOutlet weak var Pressbutton: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Pressbutton.layer.cornerRadius = 10
        Pressbutton.layer.borderWidth = 1.5
        
        // Do any additional setup after loading the view.
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

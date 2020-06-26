//
//  GameViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/06/19.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var number: Int = 0
    
    @IBOutlet var label: UILabel!
    var count: Float = 0
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        count = 60
        
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func up() {
        //countを1引く
        count = count - 1
        print("ビスコのじかん")
        print(count)
    
        label.text = String(count)
        
    }
    
    @IBAction func tapActionUe1Hidari(_ sender: Any) {
        number += 2
    }

    @IBAction func tapActionUe1Naka(_ sender: Any) {
        number += 1
    }

    @IBAction func tapActionUe1Migi(_ sender: Any) {
        number += 1
    }

    @IBAction func tapActionUe2Hidari(_ sender: Any) {
        number -= 3
    }

    @IBAction func tapActionUe2Naka(_ sender: Any) {
        number -= 3
    }

    @IBAction func tapActionUe2Migi(_ sender: Any) {
        number += 1
    }

    @IBAction func tapActionUe3Hidari(_ sender: Any) {
        number += 2
    }

    @IBAction func tapActionUe3Naka(_ sender: Any) {
        number -= 3
    }

    @IBAction func tapActionUe3Migi(_ sender: Any) {
        number += 2
    }

    @IBAction func tapActionUe4Hidari(_ sender: Any) {
        number += 1
    }

    @IBAction func tapActionUe4Naka(_ sender: Any) {
        number -= 3
    }

    @IBAction func tapActionUe4migi(_ sender: Any) {
        number += 2
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

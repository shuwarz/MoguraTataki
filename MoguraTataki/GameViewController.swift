//
//  GameViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/06/19.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // 得点
    var number: Int = 0
    
    //乱数を入れるためのIntの変数を用意
    var ransu: Int = 0
    
    @IBOutlet var moguralabel: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var Ue1HidariButton: UIButton!
    @IBOutlet var Ue1NakaButton: UIButton!
    @IBOutlet var Ue1MigiButton: UIButton!
    @IBOutlet var Ue2HidariButton: UIButton!
    @IBOutlet var Ue2NakaButton: UIButton!
    @IBOutlet var Ue2MigiButton: UIButton!
    @IBOutlet var Ue3HidariButton: UIButton!
    @IBOutlet var Ue3NakaButton: UIButton!
    @IBOutlet var Ue3MigiButton: UIButton!
    @IBOutlet var Ue4HidariButton: UIButton!
    @IBOutlet var Ue4NakaButton: UIButton!
    @IBOutlet var Ue4MigiButton: UIButton!
    
    var count: Float = 0
    
    var timer: Timer = Timer()
    
    @IBOutlet var pointLabel: UILabel!
    
    var colorArray = [UIColor.magenta, UIColor.blue, UIColor.cyan, UIColor.black, UIColor.brown, UIColor.orange, UIColor.purple, UIColor.red] //出てくる色
    
    var fontArray = ["Zapfino", "HiraginoKakuGothic", "Menlo", "Futura", "LaoSangamMN", "GillSans", "Didot"] //出てくるフォント
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        count = 60
        
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
        }
        
        //『結果へ』ボタンを非表示にする
        button.isHidden = true
    }
    
    @objc func up() {
        //countを1引く
        count = count - 1
        
        //countが0になったとき止まる
        if count <= 0 {
            print("タイマーが0になりました")
            
            timer.invalidate()
            //『結果へ』ボタンを表示する
            button.isHidden = false
        }
        
        print("ビスコのじかん") //ﾌﾊﾊﾊﾊﾊ ｺﾉ ﾌﾟﾛｼﾞｪｸﾄ ﾊ ﾜﾚ ｶﾞ ﾉｯﾄｯﾀ!! ｼﾝﾘｬｸｼｬ ｳﾁｭｳｼﾞﾝ　 ﾖﾘ
        print(count)
        buttonHyouji()
        
        label.text = String(count)
    }
    
    @IBAction func tapActionUe1Hidari(_ sender: Any) {
        number += 2
        pointLabel.text = String(number) //点数の合計を表示させる
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe1Naka(_ sender: Any) {
        number += 1
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe1Migi(_ sender: Any) {
        number += 1
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe2Hidari(_ sender: Any) {
        number -= 3
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe2Naka(_ sender: Any) {
        number -= 3
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe2Migi(_ sender: Any) {
        number += 1
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe3Hidari(_ sender: Any) {
        number += 2
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe3Naka(_ sender: Any) {
        number -= 3
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe3Migi(_ sender: Any) {
        number += 2
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe4Hidari(_ sender: Any) {
        number += 1
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe4Naka(_ sender: Any) {
        number -= 3
        pointLabel.text = String(number)
        BashoTolabelToFont()
    }
    
    @IBAction func tapActionUe4migi(_ sender: Any) {
        number += 2
        pointLabel.text = String(number)
        BashoTolabelToFont()
        
    }
    
    func BashoTolabelToFont() {
        pointLabel.textColor = colorArray.randomElement() //ColorArrayからランダムに選びます
        // pointLabel.font = UIFont(name: fontArray.randomElement()!, size: 56)
        //fontArrayからサイズは56で統一にします
        //pointLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    @IBAction func start() {
        
        
    }
    
    @IBAction func stop() {
        
        
    }
    
    func buttonHyouji() {
        ransu = Int.random(in: 0...11)
        
        if ransu == 0 {
            //Ue1Hidariが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = false
            Ue1HidariButton.isHidden = true
            Ue1NakaButton.isHidden = true
            Ue1MigiButton.isHidden = true
            Ue2HidariButton.isHidden = true
            Ue2NakaButton.isHidden = true
            Ue2MigiButton.isHidden = true
            Ue3HidariButton.isHidden = true
            Ue3NakaButton.isHidden = true
            Ue3MigiButton.isHidden = true
            Ue4HidariButton.isHidden = true
            Ue4NakaButton.isHidden = true
            Ue4MigiButton.isHidden = true
            
        }
        if ransu == 1 {
            //Ue1Nakaが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
            Ue1HidariButton.isHidden = false
            Ue1NakaButton.isHidden = true
            Ue1MigiButton.isHidden = true
            Ue2HidariButton.isHidden = true
            Ue2NakaButton.isHidden = true
            Ue2MigiButton.isHidden = true
            Ue3HidariButton.isHidden = true
            Ue3NakaButton.isHidden = true
            Ue3MigiButton.isHidden = true
            Ue4HidariButton.isHidden = true
            Ue4NakaButton.isHidden = true
            Ue4MigiButton.isHidden = true
        }
        if ransu == 2 {
            //Ue1Migiが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
            Ue1NakaButton.isHidden = true
            Ue1MigiButton.isHidden = false
            Ue2HidariButton.isHidden = true
            Ue2NakaButton.isHidden = true
            Ue2MigiButton.isHidden = true
            Ue3HidariButton.isHidden = true
            Ue3NakaButton.isHidden = true
            Ue3MigiButton.isHidden = true
            Ue4HidariButton.isHidden = true
            Ue4NakaButton.isHidden = true
            Ue4MigiButton.isHidden = true
        }
        if ransu == 3 {
            //Ue2Hidariが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
            Ue1NakaButton.isHidden = true
            Ue1MigiButton.isHidden = true
            Ue2HidariButton.isHidden = false
            Ue2NakaButton.isHidden = true
            Ue2MigiButton.isHidden = true
            Ue3HidariButton.isHidden = true
            Ue3NakaButton.isHidden = true
            Ue3MigiButton.isHidden = true
            Ue4HidariButton.isHidden = true
            Ue4NakaButton.isHidden = true
            Ue4MigiButton.isHidden = true
        }
        if ransu == 4 {
            //Ue2Nakaが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = false
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
        }
        if ransu == 5 {
            //Ue2Migiが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = false
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
        }
        if ransu == 6 {
            //Ue3Hidariが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = false
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
        }
        if ransu == 7 {
            //Ue3Nakaが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = false
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
            
        }
        if ransu == 8 {
            //Ue3Migiが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = false
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
        }
        if ransu == 9 {
            //Ue4Hidariが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = false
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = true
        }
        if ransu == 10 {
            //Ue4NAkaが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = false
             Ue4MigiButton.isHidden = true
        }
        if ransu == 11 {
            //Ue4Migiが表示（他は非表示）
            //乱数を入れるためのInt型の変数を用意
            Ue1HidariButton.isHidden = true
             Ue1NakaButton.isHidden = true
             Ue1MigiButton.isHidden = true
             Ue2HidariButton.isHidden = true
             Ue2NakaButton.isHidden = true
             Ue2MigiButton.isHidden = true
             Ue3HidariButton.isHidden = true
             Ue3NakaButton.isHidden = true
             Ue3MigiButton.isHidden = true
             Ue4HidariButton.isHidden = true
             Ue4NakaButton.isHidden = true
             Ue4MigiButton.isHidden = false
        }
    }
    
    //①セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //②セグエの識別子確認
        if segue.identifier == "toResult" {
            
            //③遷移先ViewControllerの取得
            let nextView = segue.destination as! ResultViewController
            
            //④値の設定
            nextView.saishusukoa = number
            
        }
    }
    
}

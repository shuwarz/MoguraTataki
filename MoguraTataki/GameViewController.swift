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
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var label: UILabel!
    var count: Float = 0
    
    var timer: Timer = Timer()
    
    var pointLabel = UILabel()
    
    var colorArray = [UIColor.magenta, UIColor.blue, UIColor.cyan, UIColor.black, UIColor.brown, UIColor.orange, UIColor.purple, UIColor.red] //出てくる色
    
    var fontArray = ["Zapfino", "HiraginoKakuGothic", "Menlo", "Futura", "LaoSangamMN", "GillSans", "Didot"] //出てくるフォント
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(true, animated: false)

        labellabellabel()
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
            //『結果へ』ボタンを表示する
            button.isHidden = false
        }
       
        print("ビスコのじかん") //ﾌﾊﾊﾊﾊﾊ ｺﾉ ﾌﾟﾛｼﾞｪｸﾄ ﾊ ﾜﾚ ｶﾞ ﾉｯﾄｯﾀ!! ｼﾝﾘｬｸｼｬ ｳﾁｭｳｼﾞﾝ　sakurako ﾖﾘ
        print(count)
    
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
    
    
    func labellabellabel() {
        // UILabelの設定
        pointLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height) // 位置とサイズの指定
        pointLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        pointLabel.text = "0000" // テキストの設定
        pointLabel.textColor = UIColor.clear // テキストカラーの設定
        pointLabel.font = UIFont(name: "Zapfino", size: 56) // フォントの設定
        pointLabel.adjustsFontSizeToFitWidth = true //　枠にきっちりと入るようにします
        self.view.addSubview(pointLabel) // ラベルの追加
        self.view.bringSubviewToFront(pointLabel) //　最前面にラベルを持ってくる
    }
    
    func BashoTolabelToFont() {
        let x = Int.random(in: 1...200)
        let y = Int.random(in: 1...400)
        let width = Int.random(in: 10...414)
        let height = Int.random(in: 10...896)
        pointLabel.frame = CGRect(x: x, y: y, width: width, height: height) //ここに表示します
        pointLabel.textColor = colorArray.randomElement() //ColorArrayからランダムに選びます
        pointLabel.font = UIFont(name: fontArray.randomElement()!, size: 56)
        //fontArrayからフォントをランダムに選び、サイズは56で統一にします
        pointLabel.adjustsFontSizeToFitWidth = true
        
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

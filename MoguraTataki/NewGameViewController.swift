//
//  NewGameViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/11/13.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    var generateImageTimer = Timer()

    override func viewDidLoad() {
            
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIIMageView), userInfo: nil, repeats: true)
        
        
    }
    
    
   @objc func generateUIIMageView() -> Void {
    
    //画像の名前
        let fishArray:[String] = ["katuo","squid","pufferFish"]
    
    // 配列からランダムな名前を取り出す
        let randomImageElement = fishArray.randomElement()!
    
    // UIImageの初期化
        let image: UIImage = UIImage(named: fishArray.randomElement()!)!
    
    // 画像が押された時用に識別子を設定
        image.accessibilityIdentifier = randomImageElement

    //UIImageViewの初期化
        let imageView = UIImageView(image: image)
    
    //画面の縦幅・横幅を取得
        let viewWidth: CGFloat = view.frame.size.width
        let viewHeight: CGFloat = view.frame.size.height
    
    //画面に設定したい縦・横幅を変数に格納
        let imageWidth: CGFloat = 100
        let imageHeight: CGFloat = 100
    
    //画像の座標・大きさを生成
        let rect: CGRect = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
    
    // 指定した座標・大きさを設定
        imageView.frame = rect;

    // 画像を画面の中央を指定
        imageView.center = CGPoint(x: CGFloat.random(in: 0...viewWidth), y: CGFloat.random(in: 0...viewHeight))

    // viewにUIImageViewを追加
        self.view.addSubview(imageView)
    
    // ユーザーのタップなどを認識するように設定！
        imageView.isUserInteractionEnabled = true
    
    // タップされたときに呼ばれる関数を登録
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
    
    // 1秒後に画像が消えるように設定！
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                imageView.removeFromSuperview()
            
        }
            
   }
    
    // ボタンが押されたときの処理
        @objc func imageViewTapped(sender: UITapGestureRecognizer) {
            // タップ元を取得&識別子を取得
            let view = sender.view as! UIImageView
            let identifier = view.image?.accessibilityIdentifier!
            
            // タップされたときに消える！
            sender.view?.removeFromSuperview()
            
            // 上で設定した識別子に合わせてコンソールに出力する文字列を変えるSwitch文！
            switch identifier {
            case "katuo":
                print("カツオ")
            case "squid":
                print("イカ")
            case "pufferFish":
                print("フグ")
            default:
                print("???")
            }
            
        }



}

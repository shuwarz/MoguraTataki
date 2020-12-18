//
//  GameViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/06/19.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var generateImageTimer = Timer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIIMageView), userInfo: nil, repeats: true)
    }
    
    @objc func generateUIImageView() -> void {
        
        //画像の名前
            let fishArray:[String] = ["katuo","squid","pufferfish"]
        
        //配列からランダムな名前を取り出す
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

    }
}



//
//  GameViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/06/19.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var background: UIImageView!
    
    @IBOutlet var timelimitLabal: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
	
	@IBOutlet weak var pauseButton: UIButton!
	@IBOutlet weak var pauseLabel: UILabel!
	var isPaused: Bool = false
	
    var generateImageTimer = Timer()
    
    var score: Int = 0
    var timelimit: Int = 30
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIImageView), userInfo: nil, repeats: true)
        
        //『結果へ』ボタンを非表示にする
        button.isHidden = true
		pauseLabel.isHidden = true
		pauseButton.tintColor = .black
    }
    
    @objc func generateUIImageView() {
        timelimit = timelimit - 1
        timelimitLabal.text = String(timelimit)
        //countが0になったとき止まる
        if timelimit <= 0 {
            print("タイマーが0になりました")
            
            generateImageTimer.invalidate()
            //『結果へ』ボタンを表示する
            button.isHidden = false
			pauseButton.isEnabled = false
        }
        
        background.isUserInteractionEnabled = true
        
        //画像の名前
        let fishArray:[String] = ["katuo","squid","pufferFish"]
        //配列からランダムな名前を取り出す
        let randomImageElement = fishArray.randomElement()!
        print(randomImageElement)
        // UIImageの初期化
        let image: UIImage = UIImage(named: randomImageElement)!
        
        // 画像が押された時用に識別子を設定
        image.accessibilityIdentifier = randomImageElement
        
        //UIImageViewの初期化
        let imageView = UIImageView(image: image)
        
        //画面の縦幅・横幅を取得
        let viewWidth: CGFloat = background.frame.size.width
        let viewHeight: CGFloat = background.frame.size.height
        
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
        self.background.addSubview(imageView)
        
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
            score = score + 3
            scoreLabel.text = String(score)
            print("カツオ")
        case "pufferFish":
            score = score + 2
            scoreLabel.text = String(score)
            print("フグ")
        case "squid":
            score = score - 5
            scoreLabel.text = String(score)
            print("イカ")
        default:
            print("???")
            
        }
        
    }
	
	@IBAction func toggleTimer() {
		isPaused = !isPaused
		if isPaused {
			pauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
			generateImageTimer.invalidate()
			pauseLabel.isHidden = false
		} else {
			pauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
			generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIImageView), userInfo: nil, repeats: true)
			pauseLabel.isHidden = true
		}
		
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            //②セグエの識別子確認
            if segue.identifier == "toResult" {
                
                //③遷移先ViewControllerの取得
                let nextView = segue.destination as! ResultViewController
                
                //④値の設定
                nextView.saishusukoa = score
                
            }
        }

    
}



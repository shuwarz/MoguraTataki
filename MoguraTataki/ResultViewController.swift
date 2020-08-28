//
//  ResultViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/06/19.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
     //①引数
    var saishusukoa = 0
    
    @IBOutlet weak var kekkalabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //②引数をラベルにセット
        kekkalabel.text = String(saishusukoa)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Modoru () {
        self.navigationController?.popToRootViewController(animated: true)
        //結果画面からトップ画面にもどる』
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

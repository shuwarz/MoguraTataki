//
//  ModalViewController.swift
//  MoguraTataki
//
//  Created by 今泉　孝陽 on 2020/12/04.
//  Copyright © 2020 app.com.Takaharu.Imaizumi. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeModal() {
            self.dismiss(animated: true, completion: nil)
        }
   

}

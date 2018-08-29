//
//  ViewController.swift
//  PHTextViewDemo
//
//  Created by Public on 2018/8/28.
//  Copyright © 2018年 Public. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = PHTextView(frame:CGRect.init(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 200))
        textView.placeholder = "请输入您想要的内容"
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 3
        textView.font = UIFont.systemFont(ofSize: 19)
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


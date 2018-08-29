//
//  PHTextView.swift
//  PHTextViewDemo
//
//  Created by Public on 2018/8/28.
//  Copyright © 2018年 Public. All rights reserved.
//

import UIKit

class PHTextView: UITextView {

    ///文字内容
    var placeholder : String?{
        didSet{
            self.placeholderLabel?.text = placeholder
            self.setNeedsLayout()
        }
    }
    ///文字颜色
    var placeholderColor : UIColor?{
        didSet{
            self.placeholderLabel?.textColor = placeholderColor
        }
    }
    
    //重写父类的set方法
    override var font: UIFont?{
        didSet{
            placeholderLabel?.font = font
            //重新计算子控件frame
            self.setNeedsLayout()
        }
    }
    
    override var text: String!{
        didSet{
            self.textDidChange()
        }
    }
    
    override var attributedText: NSAttributedString!{
        didSet{
            self.textDidChange()
        }
    }
    
    private var placeholderLabel : UILabel?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.backgroundColor = UIColor.clear
        self.placeholderLabel = UILabel()
        self.placeholderLabel?.backgroundColor = UIColor.clear
        self.placeholderLabel?.numberOfLines = 0//设置可以输入多行文字时可以自动换行
        self.addSubview(self.placeholderLabel!)
        
        self.font = UIFont.systemFont(ofSize: 17) //设置默认的字体
        self.placeholderColor = UIColor.lightGray //设置占位文字默认颜色
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: self)//通知:监听文字的改变
    }
    
    @objc private func textDidChange(){
        self.placeholderLabel?.isHidden = self.hasText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //重置高度:左边距5，上边距8
        let maxSize = CGSize.init(width: self.frame.width-10, height:CGFloat(MAXFLOAT))
        let height = (placeholder?.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : self.placeholderLabel?.font as Any], context: nil).size.height)!
        self.placeholderLabel?.frame = CGRect.init(x: 5, y: 8, width: self.frame.width-10, height: height)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

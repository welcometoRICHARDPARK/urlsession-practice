//
//  ViewController.swift
//  postmethod
//
//  Created by 박대희 on 2021/02/13.
//

import Foundation
import UIKit
import SnapKit

class CustomViewController: UIViewController {
    public var contentTextField : UITextField = UITextField()
    public var contentTypeTextField : UITextField = UITextField()
    public var writerTypeTextField : UITextField = UITextField()
    
    public var button : UIButton = UIButton()
    
    
    private func addTextFieldView() {
        self.view.addSubview(contentTextField)
        self.view.addSubview(contentTypeTextField)
        self.view.addSubview(writerTypeTextField)
        self.view.addSubview(button)
    }
    
    private func ViewLayout() {
        contentTextField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        contentTextField.backgroundColor = .blue
        
        contentTypeTextField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(contentTextField.snp.bottom).offset(20)
        }
        contentTypeTextField.backgroundColor = .yellow
        
        writerTypeTextField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(contentTypeTextField.snp.bottom).offset(20)
        }
        writerTypeTextField.backgroundColor = .black
        
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(writerTypeTextField.snp.bottom).offset(20)
        }
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
    }
    let postDataHandeled = DataHandeling()
    @objc func clickButton(_ sender: UIButton){
        let content = self.contentTextField.text!
        let contentType = self.contentTypeTextField.text!
        let writerType = self.writerTypeTextField.text!
        
        postDataHandeled.post(content: content, contentType: contentType, writerType: writerType)
    }
    
   
    
   
    public override func viewDidLoad() {
        addTextFieldView()
        ViewLayout()
       
        
    }
}

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
    public var contentTextField : UILabel = UILabel()
    public var contentTypeTextField : UILabel = UILabel()
    public var writerTypeTextField : UILabel = UILabel()
    
    private var a = DataHandeling()
    
    private func addTextFieldView() {
        self.view.addSubview(contentTextField)
        self.view.addSubview(contentTypeTextField)
        self.view.addSubview(writerTypeTextField)
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
        
        contentTextField.text = "test해볼려고 그러는데 성공했으면 좋겠다"
        contentTypeTextField.text = "FACEBOOK"
        writerTypeTextField.text = "ANONYMOUS"
    }
    
    let postDataHandeled = DataHandeling()
    
   
    public override func viewDidLoad() {
        addTextFieldView()
        ViewLayout()
        postDataHandeled.post()
        
    }
}

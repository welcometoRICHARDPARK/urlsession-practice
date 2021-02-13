//
//  ViewController.swift
//  postmethod
//
//  Created by 박대희 on 2021/02/13.
//

import Foundation
import UIKit

class CustomViewController: UIViewController {
    let postDataHandeled = DataHandeling()
    
    
    
    public override func viewDidLoad() {
        postDataHandeled.post()
    }
}

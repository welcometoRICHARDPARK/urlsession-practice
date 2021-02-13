//
//  ViewController.swift
//  postmethod
//
//  Created by 박대희 on 2021/02/12.
//

import UIKit

class ViewController: UIViewController {
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJpYXQiOjE2MTI4NTM4Njl9.4SPbd-J_3jrKgf-JS3yiXo7PIwJEqTnwTvOh0YpMPdM"
    let url = URL(string: "http://test.ground.yourssu.com:8080/v1/boards/2/post")!
    let session = URLSession.shared
    
    let json = [
        "attachmentIds" : [],
        "content" : "오늘 날씨 너무 좋다. 나랑 놀자. 코로나 너무 싫어",
        "spec" : [
            "contentType" : "FACEBOOK",
            "writerType" : "ANONYMOUS"
        ]
    ] as [String : Any]
    
    
    private func post() {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        
    }
    
    public override func viewDidLoad() {
    }
}


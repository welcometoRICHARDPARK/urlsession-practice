//
//  ViewController.swift
//  postmethod
//
//  Created by 박대희 on 2021/02/12.
//

import UIKit

class DataHandeling  {
    var contentString : String = String()
    var contentTypeString : String = String()
    var writerTypeString : String = String()
    
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJpYXQiOjE2MTI4NTM4Njl9.4SPbd-J_3jrKgf-JS3yiXo7PIwJEqTnwTvOh0YpMPdM"
    let url = URL(string: "http://test.ground.yourssu.com:8080/v1/boards/2/post")!
    let session = URLSession.shared
    
    
    public func post(content : String, contentType : String, writerType : String) {
        let json = [
            "attachmentIds" : [],
            "content" : "\(content)",
            "spec" : [
                "contentType" : "\(contentType)",
                "writerType" : "\(writerType)"
            ]
        ] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            
            guard let postResponse = response as? HTTPURLResponse else {return} // optional binding
            print(postResponse.statusCode)
            guard let data = data, let dataString = String(data: data, encoding: .utf8) else {return} // optional binding
            print(dataString)
        }
        task.resume()
    }
    
}


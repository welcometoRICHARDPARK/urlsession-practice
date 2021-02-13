//
//  PostData.swift
//  postmethod
//
//  Created by 박대희 on 2021/02/13.
//

import Foundation
import ObjectMapper

struct Posts: Mappable {
    var attachmentIds : [Int]
    var content : String
    var spec : [specInformation]
    init?(map: Map) {
        attachmentIds = [Int]()
        content = String()
        spec = [specInformation]()
    }
    
    mutating func mapping(map: Map) {
        attachmentIds <- map[""]
        content <- map["content"]
    }
}
struct specInformation : Mappable {
    var contentType : String
    var writerType : String
    init?(map: Map) {
        contentType = String()
        writerType = String()
    }
    
    mutating func mapping(map: Map) {
        contentType <- map["contentType"]
        writerType <- map["writerType"]
        
    }
}

//
//  data.swift
//  getmethod
//
//  Created by 박대희 on 2021/02/12.
//

import Foundation

struct posts : Codable {
    var attachments : [attachmentsInformation]?
    var boardId : Int
    var commentCount : Int
    var content : String
    var createdAt : String
    var filter : filterInformation?
    var id : Int
    var reactions : [reactionsInformation]?
    var spec : specInformation?
    var title : String?
    var updatedAt : String?
    var views : Int?
    var writer : writerInformation?
}

struct specInformation : Codable {
    var contentType : String
    var writerType : String
}
struct writerInformation : Codable {
    var deleted : Bool
    var id : Int
    var nickname : String
    var thumbnail : String
}
struct reactionsInformation : Codable {
    var id : Int
    var name : String
    var size : Int
    var reacted : Bool
}

struct attachmentsInformation : Codable {
    var id : Int
    var name : String
    var type : String
    var url : String
    enum CodingKeys: String, CodingKey {
        case id, name, type, url
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(Int.self, forKey: .id)) ?? 0
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        type = (try? values.decode(String.self, forKey: .type)) ?? ""
        url = (try? values.decode(String.self, forKey: .url)) ?? ""
    }
}

struct filterInformation : Codable {
    var bannedWords : Int
    var politics : Int
}

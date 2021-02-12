//
//  data.swift
//  getmethod
//
//  Created by 박대희 on 2021/02/12.
//

import Foundation

struct posts : Codable {
    var attachments : [attachmentsInformation]?
    
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

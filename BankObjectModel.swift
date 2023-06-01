//
//  BankObjectModel.swift
//  PruebaTecnica
//
//  Created by HLS GROUP on 31/05/23.
//

import Foundation

struct BankObjectModel: Codable, Identifiable {
    let id = UUID()
    let bankDescription: String
    let age: Int
    let url: String
    let bankName: String
    
    enum CodingKeys: String, CodingKey {
        case bankDescription = "description"
        case age = "age"
        case url = "url"
        case bankName = "bankName"
        
    }
}

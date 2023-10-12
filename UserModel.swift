//
//  UserModel.swift
//  app señas mk. 1
//
//  Created by Alumno on 02/10/23.
//

import Foundation

struct ResultApiUser : Decodable{
    var user: [UserModel]
    
    enum CodingKeys : String, CodingKey{
        case user
    }
}

struct UserModel : Identifiable, Decodable{
    var id: Int
    var user: String
    var email: String
    var password: String
    var age: Int
    var adminprivilege: Bool
    
    enum CodingKeys : String, CodingKey{
        case id
        case user
        case email
        case password
        case age
        case adminprivilege
    }
}






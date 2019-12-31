//
//  Post.swift
//  demo-mobile
//
//  Created by k on 30/12/2019.
//  Copyright © 2019 k. All rights reserved.
//

import Foundation
struct P: Codable, Identifiable {
    let id: Int
    let c,t,u,i,a: String

    enum CodingKeys: CodingKey {
        case id,c,t,u,i,a
    }
}

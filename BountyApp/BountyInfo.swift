//
//  BountyInfo.swift
//  BountyApp
//
//  Created by Randy Won on 2020/03/23.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

struct BountyInfo { // model
    
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}

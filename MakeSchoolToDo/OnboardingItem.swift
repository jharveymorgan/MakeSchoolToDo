//
//  OnboardingItem.swift
//  MakeSchoolToDo
//
//  Created by Jordan Harvey-Morgan on 7/10/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation
import UIKit

class OnboardingItem {
    var title: String
    var description: String
    var image: UIImage
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}

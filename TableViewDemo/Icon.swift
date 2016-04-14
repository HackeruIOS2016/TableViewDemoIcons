//
//  Icon.swift
//  TableViewDemo
//
//  Created by HackerU on 14/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit


class Icon{
    var title:String
    var subtitle:String
    var image:UIImage
    
    init(withTitle title:String, subtitle:String,imageName:String ){
        self.title = title
        self.subtitle = subtitle
        self.image = UIImage(named: imageName)!
    }
}
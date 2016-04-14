//
//  ViewController.swift
//  TableViewDemo
//
//  Created by HackerU on 14/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var data:Icon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = data?.title
        subtitleLabel.text = data?.subtitle
        imageView.image = data?.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


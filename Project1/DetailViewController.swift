//
//  DetailViewController.swift
//  Project1
//
//  Created by appinventiv on 25/11/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: String?
    var title1: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = title1
        // Do any additional setup after loading the view.
        if let img = selectedImg {
            imageView.image = UIImage(named: img)
        }
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

  
}

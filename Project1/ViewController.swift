//
//  ViewController.swift
//  Project1
//
//  Created by appinventiv on 25/11/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        {
            screen.selectedImg = pictures[indexPath.row]
            screen.title1 = "\(indexPath.row+1)/\(pictures.count)"
            navigationController?.pushViewController(screen, animated: true)
        }
    }
    
    @objc func shareTapped() {
        
        let url = URL(string: "Https://apple.com")
        let text = "This is the text...."
        let image = UIImage(named: "Product")
        let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")

        let vc = UIActivityViewController(activityItems: [text, image, myWebsite], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}


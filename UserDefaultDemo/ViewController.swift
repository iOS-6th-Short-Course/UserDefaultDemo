//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by Chhaileng Peng on 1/19/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UserDefaults.standard.set("Chhaileng Peng", forKey: "username")
        
//        UserDefaults.standard.removeObject(forKey: "username")
        
        let username = UserDefaults.standard.string(forKey: "username")
        print(username ?? "username is nil")
        
        
        
        
        if UserDefaults.standard.bool(forKey: "darkMode") {
            view.backgroundColor = .black
            switchButton.setOn(true, animated: false)
        } else {
            view.backgroundColor = .white
            switchButton.setOn(false, animated: false)
        }
        
        
        
        // image
        
        
        
        if UserDefaults.standard.data(forKey: "imageCache") == nil {
            DispatchQueue.main.async {
                let data = try? Data(contentsOf: URL(string: "https://www.hdwallpapers.in/download/sunset_cityscape_4k_5k-5120x2880.jpg")!)
                
                UserDefaults.standard.set(data, forKey: "imageCache")
                self.imageView.image = UIImage(data: data!)
            }
        } else {
            let data = UserDefaults.standard.data(forKey: "imageCache")
            self.imageView.image = UIImage(data: data!)
        }
        
//        UserDefaults.standard.removeObject(forKey: "imageCache")
        
        
        
        
    }

    @IBAction func darkModeChanged(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "darkMode") == true {
            UserDefaults.standard.set(false, forKey: "darkMode")
            view.backgroundColor = .white
        } else {
            UserDefaults.standard.set(true, forKey: "darkMode")
            view.backgroundColor = .black
        }
    }
    
}


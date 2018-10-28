//
//  ViewController.swift
//  core data Sample
//
//  Created by Tony Gao on 28/10/18.
//  Copyright © 2018 Tony Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
        setupNavigationStyle()
    }

    @objc func handleAddCompany() {
        print("adding compnay")
    }
    
    func setupNavigationStyle () {
        // set light red
        let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1  )
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = lightRed
        
        // set large title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}


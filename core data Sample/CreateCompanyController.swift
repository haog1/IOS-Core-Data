//
//  CreateCompanyController.swift
//  core data Sample
//
//  Created by Tony Gao on 29/10/18.
//  Copyright © 2018 Tony Gao. All rights reserved.
//

import UIKit
import CoreData

protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    var delegate: CreateCompanyControllerDelegate?
    
    //    var companiesController: CompaniesContoller?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        // enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        
        view.backgroundColor = .darkBlue
    }
    
    private func setupUI() {
        
        let lightBlueBackgroundView = UIView()
        
        lightBlueBackgroundView.backgroundColor = .lightBlue
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lightBlueBackgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        
        view.addSubview(nameTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
    }
    
    @objc private func handleSave() {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        
        company.setValue(nameTextField.text, forKey: "name")
        
        // perform the save
        do {
            try context.save()
            
            // success
            dismiss(animated: true) {
                self.delegate?.didAddCompany(company: company as! Company)
            }
            
            
        } catch let SaveErr {
            print("Failed to save company: ", SaveErr)
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}

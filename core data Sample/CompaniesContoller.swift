//
//  ViewController.swift
//  core data Sample
//
//  Created by Tony Gao on 28/10/18.
//  Copyright © 2018 Tony Gao. All rights reserved.
//

import UIKit
import CoreData


class CompaniesContoller: UITableViewController, CreateCompanyControllerDelegate {

    func didAddCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    var companies = [Company]()

    func addCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    private func fetchCompanies() {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            companies.forEach { (company) in
                print(company.name ?? "")
            }
            
            self.companies = companies
            self.tableView.reloadData()
            
        } catch let fetchErr {
            print("Failed to fetch companies: ", fetchErr)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCompanies()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: self, action: #selector(addCompany))
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = .darkBlue
        
        tableView.separatorColor = .white
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }


    @objc func handleAddCompany() {
        let createCompanyController = CreateCompanyController()
        
        let navController = CustomNavigationControlelr(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
   
        let company = companies[indexPath.row]
        
        
        
        cell.backgroundColor = UIColor.tealColor
        // equivlent cell.backgroundColor = .tealColor
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
}


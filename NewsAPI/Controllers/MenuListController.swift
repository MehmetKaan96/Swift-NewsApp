//
//  MenuListController.swift
//  NewsAPI
//
//  Created by Mehmet on 13.08.2022.
//

import UIKit

class MenuListController: UITableViewController {
var categoryItems = ["Business","Entertainment","General","Health","Science","Sports","Technology"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryItems.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = categoryItems[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sb = storyboard?.instantiateViewController(withIdentifier: "BusinessTVC") as! BusinessCategoryTableViewController
//        navigationController?.pushViewController(sb, animated: true)
        
        switch indexPath.row{
        case 0:
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vcTitles =  storyBoard.instantiateViewController(withIdentifier: "BusinessTVC") as! BusinessCategoryTableViewController
            self.navigationController?.pushViewController(vcTitles, animated: true)
        default:
            print("will do")
        }
        
        
    }
    

}


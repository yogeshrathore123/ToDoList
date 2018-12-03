//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Yogesh Rathore on 03/12/18.
//  Copyright © 2018 Nissan Digital Hub. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    let itermArray = ["Apple", "Samsung", "Vivo", "Xiomi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Mmark:: TableView DataSource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itermArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = itermArray[indexPath.row]
        return cell
    }
    
    //  Mark:: TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itermArray[indexPath.row])
        // Mark:: Checking condition checkmark is there or not
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // Mark:: For row select Animation
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


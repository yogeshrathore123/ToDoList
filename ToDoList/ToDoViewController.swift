//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Yogesh Rathore on 03/12/18.
//  Copyright © 2018 Yogesh Rathore. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itermArray = ["Apple", "Samsung", "Vivo", "Xiomi"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let item = defaults.array(forKey: "ToDoListArray") as? [String]{
            itermArray = item
        }
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
    @IBAction func AddItemBtnAction(_ sender: UIBarButtonItem) {
        var addItemTxtField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let AddItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if addItemTxtField.text?.isEmpty == false{
                self.itermArray.append(addItemTxtField.text!)
                self.tableView.reloadData()
                self.defaults.setValue(self.itermArray, forKey: "ToDoListArray")
            }else{
                print("Empty TextField")
            }
        }
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item"
            addItemTxtField = alertTextField
        }
        alert.addAction(AddItemAction)
        alert.addAction(CancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


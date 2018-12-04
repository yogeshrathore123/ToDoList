//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Yogesh Rathore on 03/12/18.
//  Copyright © 2018 Yogesh Rathore. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
     let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let itemObj = Item()
        itemObj.title = "a"
        itemArray.append(itemObj)
        let itemObj1 = Item()
        itemObj1.title = "b"
        itemArray.append(itemObj1)
        let itemObj2 = Item()
        itemObj2.title = "c"
        itemArray.append(itemObj2)
        let itemObj3 = Item()
        itemObj3.title = "d"
        itemArray.append(itemObj3)
        let itemObj4 = Item()
        itemObj4.title = "e"
        itemArray.append(itemObj4)
        let itemObj5 = Item()
        itemObj5.title = "f"
        itemArray.append(itemObj5)
        let itemObj6 = Item()
        itemObj6.title = "g"
        itemArray.append(itemObj6)
        let itemObj7 = Item()
        itemObj7.title = "h"
        itemArray.append(itemObj7)
        let itemObj8 = Item()
        itemObj8.title = "i"
        itemArray.append(itemObj8)
        let itemObj9 = Item()
        itemObj9.title = "j"
        itemArray.append(itemObj9)
        let itemObj0 = Item()
        itemObj0.title = "k"
        itemArray.append(itemObj0)
        let itemObj11 = Item()
        itemObj11.title = "l"
        itemArray.append(itemObj11)
        let itemObj12 = Item()
        itemObj12.title = "m"
        itemArray.append(itemObj12)
        let itemObj13 = Item()
        itemObj13.title = "n"
        itemArray.append(itemObj13)
        let itemObj14 = Item()
        itemObj14.title = "n"
        itemArray.append(itemObj14)
        let itemObj15 = Item()
        itemObj15.title = "n"
        itemArray.append(itemObj15)
        let itemObj16 = Item()
        itemObj16.title = "n"
        itemArray.append(itemObj16)
        let itemObj17 = Item()
        itemObj17.title = "n"
        itemArray.append(itemObj17)
        let itemObj18 = Item()
        itemObj18.title = "n"
        itemArray.append(itemObj18)
        let itemObj19 = Item()
        itemObj19.title = "n"
        itemArray.append(itemObj19)
        
//        if let item = defaults.array(forKey: "ToDoListArray") as? [Item]{
//            self.itemArray = item
//        }
        
        loadItems()
        print(dataFilePath)
        
    }
    
    // Mmark:: TableView DataSource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        let itemObj = itemArray[indexPath.row]
        cell.textLabel?.text = itemObj.title
        
        // Ternary Operator
        // Value = Condition ? ValueIfTrue : ValueIfFalse
        cell.accessoryType = itemObj.done ? .checkmark : .none
        
        return cell
    }
    
    //  Mark:: TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        // Mark:: Checking condition checkmark is there or not
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        self.saveItem()
        // Mark:: For row select Animation
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func AddItemBtnAction(_ sender: UIBarButtonItem) {
        var addItemTxtField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let AddItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if addItemTxtField.text?.isEmpty == false{
                let itemObj = Item()
                itemObj.title = addItemTxtField.text!
                self.itemArray.append(itemObj)
                self.saveItem()
               
                
                //  self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
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
    
    func saveItem(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        }catch{
            print("Error encoding item array. \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([Item].self, from: data)
            }catch{
                print("Error decoding item array, \(error)")
            }
        }
    }
    
}


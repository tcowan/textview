//
//  ViewController.swift
//  Inventory
//
//  Created by Ted Cowan

import UIKit

struct Item{
    var sDesc: String = ""
    var lDesc: String = ""
}

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate, AddItemProtocol, EditItemProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Grabbing info at indexpath in the item array
        let cellDesc = items[indexPath.row]

        // Setting the label
        cell.textLabel?.text = cellDesc.sDesc

        // Setting the detail text to long desc
        cell.detailTextLabel?.text = cellDesc.lDesc
        
        // Adding the chevron
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    // Creating an array of Items which is a struct
    var items: [Item]! = []
    
    // Keep track of the item being edited
    var itemBeingEdited: Int!
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.title = "Inventory"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addSegue"){
            let view = segue.destination as! AddViewController
            view.delegate = self
        } else if(segue.identifier == "editSegue"){
            let view = segue.destination as! EditViewController
            view.delegate = self
            itemBeingEdited = tableView.indexPathForSelectedRow?.row
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCell = UIContextualAction(style: .destructive, title: "Delete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            
            // delete the item
            self.items.remove(at: indexPath.row)
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteCell])
        //tableView.reloadData()
    }
    
    func addItemInfo(_ item: Item) {
        
        self.items.append(item)
        
        print("Items: \(items!)")
        
        tableView.reloadData()
    }
    
    func editItemInfo(_ item: Item) {
        items[itemBeingEdited].sDesc = item.sDesc
        items[itemBeingEdited].lDesc = item.lDesc
        tableView.reloadData()
    }
    


    



}


//
//  EditViewController.swift
//  Inventory
//
//  
//

import UIKit

protocol EditItemProtocol {
    
    func editItemInfo(_ item : Item)
}

class EditViewController: UIViewController {
    
    var delegate: EditItemProtocol?

    @IBOutlet weak var sDescription: UITextField!
    @IBOutlet weak var lDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Item"
        
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(editItem))
        
        self.navigationItem.rightBarButtonItem = save
    }
    
    @objc func editItem(){
        let receivedItemStruct = Item(sDesc: sDescription.text ?? "", lDesc: lDescription.text ?? "")
        
        delegate?.editItemInfo(receivedItemStruct)
        
        // Go back to main screen
        self.navigationController?.popViewController(animated: true)
        
    }
    
    

}

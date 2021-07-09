//
//  AddViewController.swift
//  Inventory
//
//
//

import UIKit

protocol AddItemProtocol {
    
    func addItemInfo(_ item : Item)
}

class AddViewController: UIViewController {

    var delegate: AddItemProtocol?
    
    var sDescVal: String = ""
    var lDescVal: String = ""
    
    @IBOutlet weak var sDescription: UITextField!
    @IBOutlet weak var lDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
        
        self.navigationItem.rightBarButtonItem = save
        
        self.title = "Add New Item"
    }
    
    @objc func saveItem(){
        
        let sentItemStruct = Item(sDesc: sDescription.text ?? "" , lDesc: lDescription.text  ?? "")
        
        delegate?.addItemInfo(sentItemStruct)
        
        print("SentItemStruct: \(sentItemStruct)")
        
        // Go back to main screen
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendDescriptions(_ sender: Any) {
        
    }

}

//
//  ViewController.swift
//  ToDo Test
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    @IBAction func addButton(_ sender: Any) {
        let alertDialog = UIAlertController(title: "Add To Do", message: "Enter a To Do Item", preferredStyle: .alert)
        alertDialog.addTextField{ textField in
        
            textField.placeholder = "Enter something"
            
        }
        
        let okeyButton = UIAlertAction(title: "Okey ", style: .default) { action  in
            
            guard let textField = alertDialog.textFields?[0], let inputText = textField.text, !inputText.isEmpty  else { return }
            
            self.toDoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
            
        }
        
        alertDialog.addAction(okeyButton)
        self.present(alertDialog,animated: true)
        
    
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
        
}


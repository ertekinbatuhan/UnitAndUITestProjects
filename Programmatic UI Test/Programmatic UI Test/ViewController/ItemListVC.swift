//
//  VideoListVC.swift
//  Programmatic UI Test
//
//  Created by Batuhan Berk Ertekin on 10.08.2024.
//

import UIKit

class ItemListVC: UIViewController {
    
    var tableView = UITableView()
    var itemArray : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        itemArray = fetchData()
    
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        
    }

    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
    }
}

extension ItemListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        
      // cell.videoImageView.image = videoArray[indexPath.row].image
      // cell.videoTitleLabel.text = videoArray[indexPath.row].title
        let video = itemArray[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
    
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              itemArray.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .automatic)
          }
      }
}



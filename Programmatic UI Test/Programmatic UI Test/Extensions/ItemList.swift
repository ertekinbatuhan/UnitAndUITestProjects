//
//  VideoList.swift
//  Programmatic UI Test
//
//  Created by Batuhan Berk Ertekin on 11.08.2024.
//


import UIKit

extension ItemListVC {
    
    func fetchData()  -> [Item]{
        
        let item = Item(image: UIImage(named: "signIn")!, title: "Test")
        let item1 = Item(image: UIImage(named: "github")!, title: "no storyboard")
        let item2 = Item(image: UIImage(named: "apple")!, title: " Apples is a big company")
        
        return [item,item1,item2]
    }
    
}

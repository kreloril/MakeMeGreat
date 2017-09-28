//
//  SelectionTableViewController.swift
//  MakeMeGreat
//
//  Created by John Mulvey on 9/26/17.
//  Copyright © 2017 drfirst. All rights reserved.
//

import UIKit

class SelectionTableViewController: UITableViewController {
    
    var arrayAffrimations :  NSMutableArray = []
    var arrayStateSelection : Int = -1
    
    func loadAffrimations() {
        let mb :  Bundle = Bundle.main;
        let path : String = mb.path(forResource: "data", ofType: "plist")!
        let dictAffrimations : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
      
        let arrayAffrimationsTemp : NSArray = dictAffrimations["affrimation"] as! NSArray
        
        for dict in arrayAffrimationsTemp {
            
            let affrim : AffrimModel = AffrimModel()
            affrim.initData(dict as! [AnyHashable : Any])
            arrayAffrimations.add(affrim)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAffrimations()
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }

  override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : arrayAffrimations.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "General" : "All Catagories"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
        var txt : String = ""
        
        if indexPath.section == 0 {
            txt = "All Catagories"
            if arrayStateSelection == -1 {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        } else {
            let affrim : AffrimModel = arrayAffrimations[indexPath.row] as! AffrimModel
            txt = affrim.catagoryName
            
            if arrayStateSelection == indexPath.row {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        }
        cell.textLabel?.text = txt
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.section == 0 {
            self.arrayStateSelection = -1
        } else {
            self.arrayStateSelection = indexPath.row
        }
        
        tableView.reloadData()
    }

  
}

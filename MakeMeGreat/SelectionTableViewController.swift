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
    
    
    func loadAffrimations() {
        let mb :  Bundle = Bundle.main;
        let path : String = mb.path(forResource: "data", ofType: "plist")!
        let dictAffrimations : NSMutableDictionary = NSMutableDictionary(contentsOfFile: path)!
      
        let arrayAffrimationsTemp : NSArray = dictAffrimations["affrimation"] as! NSArray
        
        print("affrimation = \(arrayAffrimationsTemp)")

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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
      
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
        } else {
            let affrim : AffrimModel = arrayAffrimations[indexPath.row] as! AffrimModel
            txt = affrim.catagoryName
        }
        cell.textLabel?.text = txt
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  MakeMeGreat
//
//  Created by John Mulvey on 9/26/17.
//  Copyright © 2017 drfirst. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var vcaffrimController : SelectionTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "sw_show_affrimation", sender: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print("segue = \(segue)")
        if segue.identifier == "sw_show_menu" {
            vcaffrimController = segue.destination as? SelectionTableViewController
        } else if segue.identifier == "sw_show_affrimation" {
            let  affrim : ShowAffrimationViewController = (segue.destination as? ShowAffrimationViewController)!
            affrim.arrayAffrimations = vcaffrimController?.arrayAffrimations
            affrim.selectionState = vcaffrimController?.arrayStateSelection
        }
        
    }

}


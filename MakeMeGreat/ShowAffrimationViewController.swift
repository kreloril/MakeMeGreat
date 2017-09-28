//
//  ShowAffrimationViewController.swift
//  MakeMeGreat
//
//  Created by John Mulvey on 9/28/17.
//  Copyright © 2017 drfirst. All rights reserved.
//

import UIKit

class ShowAffrimationViewController: UIViewController {
    
    weak var arrayAffrimations : NSMutableArray?
    var selectionState : Int?

    @IBOutlet weak var textViewAffrimation: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textViewAffrimation.text = ""

    }
    
    override func viewWillAppear(_ animated: Bool) {
 
        super.viewWillAppear(animated)
        
        showAffrimation()
    }
    
    func showAffrimation() {
        
        var rndTemp : Int?
        
        if selectionState == -1 {
            rndTemp  = Int(arc4random_uniform(UInt32(arrayAffrimations!.count)))
        } else {
            rndTemp = selectionState;
        }

        let affrim : AffrimModel = arrayAffrimations![rndTemp!] as! AffrimModel
        
        textViewAffrimation.text = affrim.getAffrimation()
        
        self.navigationItem.title = affrim.catagoryName
        
    }

    @IBAction func onSelectAffrimation(_ sender: Any) {
        
        showAffrimation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

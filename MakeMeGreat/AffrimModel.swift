//
//  AffrimModel.swift
//  MakeMeGreat
//
//  Created by John Mulvey on 9/26/17.
//  Copyright © 2017 drfirst. All rights reserved.
//

import UIKit

open class AffrimModel: NSObject {

    // varables to track affrimations
   var lastSelect : Int = -1
   var affrimationTracking : Int = 0
   
   open var catagoryName : String = ""
   open var affrimations : NSArray = []
   
   open var indexID : Int = 0
   open var selected : Int = 0
    
    
    open func initData(_ data: [AnyHashable: Any]) {
        lastSelect = -1;
        affrimations = data["data"] as! NSArray
        affrimationTracking = 0;
        catagoryName = data["name"] as! String
    }
    
    func isAssigned(_ value: Int) -> Bool {
         let valueTemp : Int = (1 << value)
        return (affrimationTracking & valueTemp) == valueTemp
    }
    
    func setAffrimationValue(_ value: Int) {
        affrimationTracking = affrimationTracking | ( 1 << value)
    }
    
    func printFoundTracking() {
        for i in 0..<affrimations.count {
            let value : Int = (1 << i)
            print ("index \(i) = \(affrimationTracking & value) \(value)")
        }
    }
    
    var failcount: Int = 0
    
    /*
 
     choose random starting postion.
 
     if  unused return it
     else test for next available slot.
     
     no slots avaible, use original random selection.
     
     */
    
    func getAffrimation() -> String {
        
        var rndTemp : Int = Int(arc4random_uniform(UInt32(affrimations.count)))
        var found : Bool = false
        
        if isAssigned(rndTemp) {
    
            for i in 0..<affrimations.count {
                
                if !isAssigned(i) {
                    rndTemp = i
                    found = true;
                    break;
                }
                
            }
            
        } else {
            found = true;
        }
        
        if found == false {
            affrimationTracking = 0;
        }
    
        setAffrimationValue(rndTemp);
        
        return affrimations[rndTemp] as! String
    }
    
    
}

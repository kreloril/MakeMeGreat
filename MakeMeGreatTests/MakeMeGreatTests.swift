//
//  MakeMeGreatTests.swift
//  MakeMeGreatTests
//
//  Created by John Mulvey on 9/26/17.
//  Copyright © 2017 drfirst. All rights reserved.
//

import XCTest
@testable import MakeMeGreat

class MakeMeGreatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let mdl : AffrimModel = AffrimModel()
      //  var carmdata1 : NSArray = ["affrim 1","Affrim 2","affrim 3"];
        let dataset : NSDictionary = ["name":"dataname","data": ["affrim 1","Affrim 2","affrim 3","affrim 4","affrim 5","affrom 6"]]
    
        mdl.initData(dataset as! [AnyHashable : Any])
        
         mdl.setAffrimationValue(0)
         //mdl.setAffrimationValue(2)
         mdl.setAffrimationValue(3)
        // mdl.setAffrimationValue(5)
         mdl.setAffrimationValue(1)
         mdl.setAffrimationValue(4)
         mdl.printFoundTracking();
        
         for i in 0..<mdl.affrimations.count {
        
            print("Affrimation found \(mdl.isAssigned(i))")
        }
        
        
        mdl.affrimationTracking = 0;
        
        
    
        NSLog("name = %@, data = %@", mdl.catagoryName,mdl.affrimations);
        
       
        
        for _ in 0..<mdl.affrimations.count {
             NSLog("rnd = %@", mdl.getAffrimation());
        }
        
        mdl.printFoundTracking();
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
   
    
}

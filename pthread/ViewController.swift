//
//  ViewController.swift
//  pthread
//
//  Created by  yanglc on 15/12/10.
//  Copyright © 2015年  yanglc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    func mylockfunc(){
        
     
        bb();
    
    }
    
    
    var th1:NSThread!
    var th2:NSThread!
    var th3:NSThread!
    var th4:NSThread!
    var lockobj = NSObject();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        th1 = NSThread(target: self, selector: "mylockfunc", object: nil);
        th1.name = "th1"
        th2 = NSThread(target: self, selector: "mylockfunc", object: nil);
        th2.name = "th2"
        th3 = NSThread(target: self, selector: "mylockfunc", object: nil);
        th3.name = "th3"
        th4 = NSThread(target: self, selector: "mylockfunc", object: nil);
        th4.name = "th4"
    }
    
    
    var ticketNum:Int = 100;
    
    func bb(){
        
        while(ticketNum > 0){
            
            objc_sync_enter(lockobj)
            
            while(ticketNum > 0){
                
                let currentTicket = ticketNum;
                
                print(NSThread.currentThread().name! + "sell" + String(currentTicket));
                
                ticketNum = ticketNum - 1;
                
                print(NSThread.currentThread().name!  +  "left" + String(ticketNum))
            }
            
            objc_sync_exit(lockobj)
            
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        th1.start()
        th2.start()
        th3.start();
        th4.start();
    }

}


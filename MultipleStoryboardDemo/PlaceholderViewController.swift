//
//  PlaceholderViewController.swift
//  ProjectStructDemo
//
//  Created by lidapeng on 10/23/15.
//  Copyright © 2015 lidapeng. All rights reserved.
//

import UIKit

class PlaceholderViewController: UIViewController {
    
    func instantiateViewControllerFromStoryboard()  -> UIViewController {
        var storyboard : UIStoryboard?
        if let identifier = self.restorationIdentifier {
            storyboard = UIStoryboard(name: identifier, bundle: nil)
        }
        
        return storyboard?.instantiateInitialViewController() as UIViewController!
    }
    
    
    override func loadView() {
        
        super.loadView()
        
        let identifier = self.restorationIdentifier
        let storyboard = UIStoryboard(name:identifier!, bundle: nil)
        
        let storyboardViewController = storyboard.instantiateInitialViewController() as UIViewController!
        
        if (storyboardViewController != nil && navigationController != nil) {
            
            let idx = indexOfObject((self.navigationController?.viewControllers)!, vc: self)
            
            if idx != NSNotFound {
                
                let vCs = self.navigationController?.viewControllers;
                let mutableVcs = NSMutableArray(array: vCs!)
                mutableVcs.replaceObjectAtIndex(idx, withObject:storyboardViewController!)
                
                let finalvCs = NSArray(array: mutableVcs) as! [UIViewController]
                
                navigationController?.setViewControllers(finalvCs, animated: false)
                
            }

        }
        
    }
    
    func indexOfObject(arr : [AnyObject], vc : UIViewController) -> Int{
        
        for var index = 0; index < arr.count; ++index {
            
            let item = arr[index]
            
            if item is UIViewController && item as! UIViewController == vc
            {
                return index
            }
            
        }
        
        return NSNotFound
    }

   

}

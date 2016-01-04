//
//  Whathehell.swift
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/22/15.
//  Copyright © 2015 thanhhaitran. All rights reserved.
//

import UIKit

class Whathehell: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func didRequestAPI()
    {
        //let request = LTRequest.share
    }
    
    @IBAction func didPressButton()
    {
        self.navigationController?.pushViewController(FBViewController(), animated: true)
        
        didRequestData("what the fuck")
        
        let mutabe:NSMutableArray? = NSMutableArray()
        
        mutabe?.addObject("hekelelelele")
        
        didRequestDataData(mutabe)
    }
    
    func didRequestData(url:String)
    {
        NSLog("%@", url)
        
    }
    
    func didRequestDataData(gDownloaders:NSMutableArray? = NSMutableArray())
    {
        NSLog("%@", gDownloaders!)
        
    }
}

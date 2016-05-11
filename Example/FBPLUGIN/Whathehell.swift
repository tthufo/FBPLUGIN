//
//  Whathehell.swift
//  FBPLUGIN
//
//  Created by thanhhaitran on 12/22/15.
//  Copyright © 2015 thanhhaitran. All rights reserved.
//

import UIKit

class Whathehell: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        print("You selected cell #\(indexPath.row)!")
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func didRequestAPI()
    {
        //let request = LTRequest();
    }
    
    @IBAction func didPressButton()
    {
        let k = FBViewController();
        
        k.kk = "ddddddddd";
        
        self.navigationController?.pushViewController(k, animated: true)
        
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

//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Jeffrey Ellin on 11/2/15.
//  Copyright © 2015 Jeffrey Ellin. All rights reserved.
//

import UIKit

import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func doSomething() {

        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let fileManager = NSFileManager.defaultManager()

        let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(paths)!
        
        print (paths)
        
        var file:String = ""
        
        while let element = enumerator.nextObject() as? String {
            file = element
        }

        let url = NSURL.fileURLWithPath("\(paths)/\(file)")
    
        let player = AVPlayer(URL: url.absoluteURL)
        
        print(url.absoluteURL)

     let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.addChildViewController(playerViewController)
        self.view.addSubview(playerViewController.view)
               playerViewController.view.frame = self.view.frame
      
        
        player.play()
    

    
}
}


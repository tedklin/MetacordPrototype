//
//  InstructionViewController.swift
//  MetacordPrototype_1.0
//
//  Created by Ted Lin on 4/10/16.
//  Copyright © 2016 Ted Lin. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var Ivc0 : InstructionViewController0?
    var Ivc1 : InstructionViewController1?
    var Ivc2 : InstructionViewController2?
    var Ivc3 : InstructionViewController3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Introduction"
        self.edgesForExtendedLayout = UIRectEdge.None

        Ivc0 = InstructionViewController0(nibName: "InstructionViewController0", bundle: nil)
        
        self.addChildViewController(Ivc0!)
        self.scrollView.addSubview(Ivc0!.view)
        Ivc0!.didMoveToParentViewController(self)
        
        Ivc1 = InstructionViewController1(nibName: "InstructionViewController1", bundle: nil)
        
        self.addChildViewController(Ivc1!)
        self.scrollView.addSubview(Ivc1!.view)
        Ivc1!.didMoveToParentViewController(self)
        
        Ivc2 = InstructionViewController2(nibName: "InstructionViewController2", bundle: nil)
        
        self.addChildViewController(Ivc2!)
        self.scrollView.addSubview(Ivc2!.view)
        Ivc2!.didMoveToParentViewController(self)
        
        Ivc3 = InstructionViewController3(nibName: "InstructionViewController3", bundle: nil)
        
        self.addChildViewController(Ivc3!)
        self.scrollView.addSubview(Ivc3!.view)
        Ivc3!.didMoveToParentViewController(self)
    }

    override func viewDidLayoutSubviews() {
        //print("viewDidLayoutSubviews viewFrame ", self.view.frame)
        //print("                      scrollViewFrame ", self.scrollView.frame)

        let scrollViewFrame = self.scrollView.frame
        
        var Iframe1 = Ivc1!.view.frame
        Iframe1.origin.x = scrollViewFrame.size.width
        Ivc1!.view.frame = Iframe1
        
        var Iframe2 = Ivc2!.view.frame
        Iframe2.origin.x = scrollViewFrame.size.width * 2
        Ivc2!.view.frame = Iframe2
        
        var Iframe3 = Ivc3!.view.frame
        Iframe3.origin.x = scrollViewFrame.size.width * 3
        Ivc3!.view.frame = Iframe3
        
        self.scrollView.contentSize = CGSizeMake(scrollViewFrame.size.width * 4, scrollViewFrame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


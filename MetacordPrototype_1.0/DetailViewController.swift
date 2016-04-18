//
//  DetailViewController.swift
//  MetacordPrototype_1.0
//
//  Created by Ted Lin on 4/10/16.
//  Copyright © 2016 Ted Lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailWebView: UIWebView!
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    //detailItem becomes the string that's set in LibraryTableViewController, so to display the different 
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            self.title = detail

            if (detailWebView != nil) {
                let path = NSBundle.mainBundle().pathForResource(detail, ofType:"html",inDirectory:"www")
                if (path != nil) {
                    let url = NSURL(fileURLWithPath: path!)
                    let urlRequest = NSURLRequest(URL:url)
                    detailWebView.loadRequest(urlRequest)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.edgesForExtendedLayout = UIRectEdge.None
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


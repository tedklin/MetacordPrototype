//
//  AnalysisResultViewController.swift
//  MetacordPrototype_1.0
//
//  Created by Ted Lin on 4/16/16.
//  Copyright © 2016 Ted Lin. All rights reserved.
//

import UIKit

class AnalysisResultViewController: UIViewController {
    
    
    @IBOutlet weak var analysisResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Analysis Results"
        analysisResult.text = output
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


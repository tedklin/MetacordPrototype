//
//  AnalysisInputViewController.swift
//  MetacordPrototype_1.0
//
//  Created by Ted Lin on 4/13/16.
//  Copyright © 2016 Ted Lin. All rights reserved.
//

import UIKit
import Darwin

public var output: String?

class AnalysisInputViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var InputPFollowedByQRS: UISegmentedControl!
    @IBOutlet weak var InputPWaveRate: UITextField!
    @IBOutlet weak var InputQRSAxis: UITextField!
    @IBOutlet weak var InputQRSDuration: UITextField!
    @IBOutlet weak var InputPWaveHeight: UITextField!
    @IBOutlet weak var InputPWaveWidth: UITextField!
    @IBOutlet weak var InputPRInterval: UITextField!
    @IBOutlet weak var InputPathologicalQWaves: UISegmentedControl!
    @IBOutlet weak var InputLeftVentHype: UISegmentedControl!
    @IBOutlet weak var InputRightVentHype: UISegmentedControl!
    @IBOutlet weak var InputQTInterval: UITextField!
    @IBOutlet weak var InputPrecedingRR: UITextField!
    @IBOutlet weak var InputSTElevation: UISegmentedControl!
    @IBOutlet weak var InputSTDepression: UISegmentedControl!
    @IBOutlet weak var InputNormalT: UISegmentedControl!
    @IBOutlet weak var InputNormalU: UISegmentedControl!
    @IBOutlet weak var InputPWaveShape: UITextField!
    @IBOutlet weak var InputPWaveDuration: UITextField!
    @IBOutlet weak var InputDeltaWaves: UISegmentedControl!
    
    var PFollowedByQRS: Bool?
    var PWaveRate: Double?
    var PWaveVariation: Double?
    var QRSAxis: Double?
    var PWaveHeight: Double?
    var PWaveWidth: Double?
    var PRInterval: Double?
    var QRSDuration: Double?
    var pathologicalQWaves: Bool?
    var leftVentHype: Bool?
    var rightVentHype: Bool?
    var QTInterval: Double?
    var PrecedingRR: Double?
    var QTc: Double = 0.0
    var STElevation: Bool?
    var STDepression: Bool?
    var normalT: Bool?
    var normalU: Bool?
    var PWaveShape: String?
    var PWaveDuration: Double?
    var DeltaWaves: Bool?
    
    var result = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Analysis Input"
        
        self.scrollView.contentSize = CGSizeMake(600, 800)
        let tapRecognizer = UITapGestureRecognizer(target:self, action:#selector(self.handleTap(_:)))
        tapRecognizer.cancelsTouchesInView = false;
        self.view.addGestureRecognizer(tapRecognizer)
        result = ("No result yet." + "\r\n" + "Need to enter data in Analyzer Input\nand tap on save first.")
    }

    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func save(sender: AnyObject) {
        
        PFollowedByQRS = (InputPFollowedByQRS.selectedSegmentIndex == 1)
        PWaveRate = Double(InputPWaveRate.text!)
        PWaveShape = InputPWaveShape.text!
        PWaveDuration = Double(InputPWaveDuration.text!)
        QRSAxis = Double(InputQRSAxis.text!)
        PWaveHeight = Double(InputPWaveHeight.text!)
        PWaveWidth = Double(InputPWaveWidth.text!)
        PRInterval = Double(InputPRInterval.text!)
        QRSDuration = Double(InputQRSDuration.text!)
        pathologicalQWaves = (InputPathologicalQWaves.selectedSegmentIndex == 1)
        leftVentHype = (InputLeftVentHype.selectedSegmentIndex == 1)
        rightVentHype = (InputRightVentHype.selectedSegmentIndex == 1)
        QTInterval = Double(InputQTInterval.text!)
        PrecedingRR = Double(InputPrecedingRR.text!)
        if (QTInterval != nil && PrecedingRR != nil && PrecedingRR != 0) {
            QTc = correctQTInterval(QTInterval!, PrecedingRR: PrecedingRR!)
        }
        STElevation = (InputSTElevation.selectedSegmentIndex == 1)
        STDepression = (InputSTDepression.selectedSegmentIndex == 1)
        normalT = (InputNormalT.selectedSegmentIndex == 1)
        normalU = (InputNormalU.selectedSegmentIndex == 1)
        DeltaWaves = (InputDeltaWaves.selectedSegmentIndex == 1)
        
        if (PWaveRate == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'P Wave Rate' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PWaveDuration == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'P Wave Duration' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (QRSAxis == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'QRS Axis' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PWaveHeight == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'P Wave Height' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PWaveWidth == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'P Wave Width' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PRInterval == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'PR Interval' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (QRSDuration == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'QRS Duration' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (QTInterval == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'QT Interval' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PrecedingRR == nil){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'Preceding R-R' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if (PrecedingRR == 0){
            let alert = UIAlertController(title: "Input Error", message: "There is an error on 'Preceding R-R' Check to make sure all boxes are filled out.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Saved", message: "Your data has been saved successfully.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        result = ""
        
        if (PFollowedByQRS == true && PWaveRate >= 60 && PWaveRate <= 100 && QRSAxis >= -30 && QRSAxis <= 90 && PWaveHeight <= 2.5 && PWaveWidth <= 0.11 && PRInterval <= 0.20 && PRInterval >= 0.12 && pathologicalQWaves != true && leftVentHype != true && rightVentHype != true && QTc <= 0.44 && QTc >= 0.350 && STElevation != true && STDepression != true && normalT == true && normalU == true && PWaveShape != "M" && PWaveDuration > 0.11 && QRSDuration > 0.07 && QRSDuration <= 0.10){
            
            result = "Normal healthy heart!"
            
        } else {
            if (STElevation == true && STDepression == true){
                result.appendContentsOf("Acute Myocardial Infraction" + "\r\n")
            }
            if (leftVentHype == true){
                result.appendContentsOf("Left Ventricular Hypertrophy" + "\r\n")
            }
            if (PRInterval > 0.2){
                result.appendContentsOf("First Degree Heart Block" + "\r\n")
            }
            if (PWaveShape == "M" && PWaveDuration > 0.11) {
                result.appendContentsOf("Left Atrial Hypertrophy" + "\r\n")
            }
            if (PWaveRate < 60){
                result.appendContentsOf("Sinus Bradycardia" + "\r\n")
            }
            if (PWaveRate > 100){
                result.appendContentsOf("Sinus Tachycardia")
            }
            if (PWaveDuration >= 0.11 && QRSDuration > 100 && (STElevation == true || STDepression == true) && normalT == false){
                result.appendContentsOf("Wolf-Parkinson-White Syndrome")
            }
            if (QTc > 0.44){
                result.appendContentsOf("Romano-Ward Syndrome")
            }
            if (PRInterval < 0.12 && DeltaWaves == false){
                result.appendContentsOf("Lown Ganong Levine Syndrome")
            }
            if (result == "") {
                result = "Not in library yet"
            }
        }
        
    }
    
    func correctQTInterval(QTInterval: Double, PrecedingRR: Double) ->Double{
        QTc = QTInterval/(sqrt(PrecedingRR))
        return QTc
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AnalysisSegue" {
            output = result
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


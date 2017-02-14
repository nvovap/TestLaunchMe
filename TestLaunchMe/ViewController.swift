//
//  ViewController.swift
//  TestLaunchMe
//
//  Created by Vladimir Nevinniy on 2/14/17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var selectedColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
    var selectedString = ""
    
    var urlApp = "testlaunchme://?color=ae6d40&text=random%20text"
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var testString: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = selectedColor
        testString.text = selectedString
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateLink()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLaunchButton(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string  = urlApp
        
        UIApplication.shared.open(URL(string:"http://ya.ru")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func testByRemovingPercent(_ sender: Any) {
//        let testString = "test%20%20test"
//        print(testString)
//        print(testString.removingPercentEncoding ?? "")
        
  //      view.backgroundColor = selectedColor
        testString.text = selectedString
        
    }
    
    func updateLink() {
        
        let textColor = String(format: "%.2x%.2x%.2x", UInt8(redSlider.value*255),  UInt8(greenSlider.value*255),  UInt8(blueSlider.value*255))
        
        urlApp = "testlaunchme://?color="+textColor+"&text="+textField.text!.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        print(urlApp)
        
    }
    
    func updateColor() {
        colorView.backgroundColor = UIColor(colorLiteralRed: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: 1)
    }
    
    @IBAction func changeGreenColor(_ sender: Any) {
        updateLink()
        updateColor()
    }
    
    @IBAction func changeBlueColor(_ sender: Any) {
        updateLink()
        updateColor()
    }
    
    @IBAction func changeColor(_ sender: Any) {
        updateLink()
        updateColor()
    }
    
    

}


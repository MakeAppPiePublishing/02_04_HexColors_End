//
//  ViewController.swift
//  HexColorComplement
//
//  Created by Steven Lipton on 2/9/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class ViewController:UIViewController{
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: - Actions
    @IBAction func goButton(_ sender: UIButton) {
        textField.resignFirstResponder()
        updateColor(colorString: textField.text!)
    }
    
    @IBAction func newColor(_ sender: UIButton) {
        textField.becomeFirstResponder()
    }
    
    func color(from hexColorNumber:UInt32) -> UIColor{
        let blue = hexColorNumber & 0x0000ff
        let green = (hexColorNumber & 0x00ff00) >> 8
        let red = (hexColorNumber & 0xff0000) >> 16
        return UIColor(red: CGFloat(red) / 255.0 , green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    func color(from string:String) -> UIColor{
        if let colorNumber = UInt32(string, radix:16){
            return color(from: colorNumber)
        } else {
            return UIColor.black
        }
    }
    
    func colorComplement(from string:String) -> UIColor{
        if let colorNumber = UInt32(string, radix:16){
            return color(from: ~colorNumber)
        } else {
            return UIColor.black
        }
    }
    func updateColor(colorString:String){
        topButton.backgroundColor = color(from: colorString)
        topButton.tintColor = colorComplement(from: colorString)
        bottomButton.backgroundColor = colorComplement(from: colorString)
        bottomButton.tintColor = color(from: colorString)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor(colorString:"ffff00")
    }
}


//
//  CodeVC.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 07/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CodeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var Selectlang: UITextField!
    @IBOutlet weak var dropdown: UIPickerView!
    @IBOutlet weak var workspace: UILabel!

    @IBOutlet weak var clean: RoundedButton!
    @IBOutlet weak var program: roundtextView!
    @IBOutlet weak var inputval: roundtextView!
    @IBOutlet weak var Run: RoundedButton!
    @IBOutlet weak var compile: RoundedButton!
    @IBOutlet weak var BACK: UIButton!
    var k = "C"
    var list = [String](arrayLiteral: "C","C++","Java","NodeJS","Python","Go","Swift")
    let thePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Selectlang.inputView = thePicker
        Run.isHidden = true
        inputval.isHidden = true
        BACK.isHidden = true
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Selectlang.text = list[row]
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.Selectlang{
            k = Selectlang.text ?? "/C"
            textField.endEditing(true)
        }
        
    }
    func output()
    {
        let body: [String : Any ] = ["language": "python",
                                     "title": "test",
                                     "public": false,
                                     "files":[[
                                        "name": "main.py",
                                        "content": "print(42)"]
            ]]
        //Alamofire.request(run , method: .post, parameters: body, encoding: JSONEncoding.default, headers: Head)
         performSegue(withIdentifier: "tooutputscreen", sender: nil)
    }
    @IBAction func proceedbtnpressed(_ sender: Any) {
        workspace.text = "Enter Input :"
        compile.isHidden = true
        Run.isHidden = false
        inputval.isHidden = false
        program.isHidden = true
        dropdown.isHidden = true
        BACK.isHidden = false
    }
    @IBAction func Submitbtnpressed(_ sender: Any) {
        output()
    }
    @IBAction func clearbtnpressed(_ sender: Any) {
       workspace.text = "Code :"
        dropdown.isHidden = false
        Run.isHidden = true
        inputval.isHidden = true
        program.isHidden = false
        compile.isHidden = false
        program.text = nil
        BACK.isHidden = true
        
    }
    @IBAction func backbtnpressed(_ sender: Any) {
        workspace.text = "Code :"
        dropdown.isHidden = false
        Run.isHidden = true
        inputval.isHidden = true
        program.isHidden = false
        compile.isHidden = false
        BACK.isHidden = true
    }
    
    
}


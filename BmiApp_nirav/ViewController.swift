//
//  ViewController.swift
//  BmiApp_nirav
//
//  Created by Niravkumar Savsani on 2022-02-17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtHeight: UITextField!
    
 
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtResult.isHidden = true
        
        
        
    }

    @IBAction func txtWeightChange(_ sender: Any) {
        txtResult.isHidden = true
    }
    
    @IBAction func txtHeightChanged(_ sender: Any) {
        txtResult.isHidden = true
    }
    @IBAction func btnCalculateBmi(_ sender: Any) {
        
        
        if !txtHeight.hasText{
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a valid number", handler: nil)
            return
        }
        if !txtWeight.hasText{
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a valid number", handler: nil)
            
            return
        }
        
        guard let weight = Double(txtWeight.text!), let height = Double(txtHeight.text!) else {
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a height between 80cm and 250cm...", handler: nil)
            return
        }
        
                
    
        
        if(height < 80 || height > 250){
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a height between 80cm and 250cm...", handler: nil)
            return
        }
        if(weight < 30 || weight > 300){
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a weight between 30Kg and 300Kg...", handler: nil)
            return
        }
        let heightMeters: Double = height * 0.01
        let bmi = round(weight/(heightMeters * heightMeters)*10)/10
        
        switch bmi {
        case 0..<18.5:
            txtResult.text = "BMI Classification = Under Weight"
            txtResult.backgroundColor = .systemBlue
            
            break
        case 18.5..<24.9:
            txtResult.text = "BMI Classification =  Normal Weight"
            txtResult.backgroundColor = .systemGreen
            break
        case 25...29.9:
            txtResult.text = "BMI Classification = Overweight"
            txtResult.backgroundColor = .systemYellow
            break
        case 30...100:
            txtResult.text = "BMI Classification = Obesity"
            txtResult.backgroundColor = .systemOrange
            break
        default:
            Toast.ok(view: self, title: "Ooops!", message: "BMI out of range", handler: nil)
            break
        }
        
        txtResult.isHidden = false
        
       
    }
}



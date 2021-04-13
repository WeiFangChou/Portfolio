//
//  ViewController.swift
//  BMI_ calculator
//
//  Created by WeiFangChou on 2021/4/13.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var image_bmi: UIImageView!
    @IBOutlet var output_bmi: UILabel!
    @IBOutlet var height_bmi: UITextField!
    @IBOutlet var height_slider: UISlider!
    @IBOutlet var weight_bmi: UITextField!
    @IBOutlet var weight_slider: UISlider!
    
    let image_array = ["thin", "normal", "overweight", "obese", "extremely obese"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }

    func initData() {
        addTapGesture()
        height_bmi.delegate = self
        weight_bmi.delegate = self

        height_slider.value = 100
        weight_slider.value = 60
        height_bmi.text = String(100)
        weight_bmi.text = String(60)
        output()
        
    }
    
    @IBAction func height_ValueChanged(_ sender: Any) {
        height_bmi.text = String(Int(height_slider.value))
        output()
        
    }
    
    @IBAction func weight_ValueChanged(_ sender: Any) {
        weight_bmi.text = String(Int(weight_slider.value))
        output()
        
    }
    
    @IBAction func height_textChanged(_ sender: Any) {
        
        if height_bmi.text != nil {
            height_slider.value = Float(height_bmi.text!)!
        }else{
            height_bmi.text = "0"
            height_slider.value = 0
        }
        output()
        
    }
    
    @IBAction func weight_textChanfged(_ sender: Any) {
        if weight_bmi.text != nil {
            weight_slider.value = Float(weight_bmi.text!)!
        }else{
            weight_bmi.text = "0"
            weight_slider.value = 0
        }
        output()
        
    }
    func addTapGesture(){
            let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(tap)
        }
    @objc private func hideKeyboard(){
            self.view.endEditing(true)
    }
    
    
    
    func output(){
        var bmi = BMICalculator(height: height_slider.value, weight: weight_slider.value)
        //print(bmi)
        output_bmi.text = String(format: "%.2f", bmi)
        
        switch bmi {
        case 0...18.5:
            self.image_bmi.image = UIImage(named: image_array[0])
            break
        case 18.5...24:
            self.image_bmi.image = UIImage(named: image_array[1])
            break
        case 24...27:
            self.image_bmi.image = UIImage(named: image_array[2])
            break
        case 27...30:
            self.image_bmi.image = UIImage(named: image_array[3])
            break
        case 30...1000:
            self.image_bmi.image = UIImage(named: image_array[4])
            break
        default:
            self.image_bmi.image = UIImage(named: image_array[4])
            break
        }
        
        
    }
    



    func BMICalculator(height: Float,weight :Float) -> Float {
        var BMI = weight / pow(height/100, 2.0)
        print(BMI)
        return BMI
    }

}

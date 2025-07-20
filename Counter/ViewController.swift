//
//  ViewController.swift
//  Counter
//
//  Created by Kristina Kostenko on 20.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "dd.MM.yyyy HH:mm"
    
    return formatter
}()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "0"
        historyTextView.text = "История изменений".uppercased()
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    
        historyTextView.layer.borderColor = UIColor.blue.cgColor
        historyTextView.layer.borderWidth = 1.0
    }
    
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        let currentText = counterLabel.text ?? "0"
        var currentValue = Int(currentText) ?? 0
        
        currentValue += 1
        
        counterLabel.text = "\(currentValue)"
        historyTextView.text += "\n\(dateFormatter.string(from: Date())): значение изменено на +1"
    }
    

    @IBAction func minusButtonTapped(_ sender: Any) {
        let currentText = counterLabel.text ?? "0"
        var currentValue = Int(currentText) ?? 0
        
        
        if currentValue > 0 {
            currentValue -= 1
            historyTextView.text += "\n\(dateFormatter.string(from: Date())): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(dateFormatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0"
        }
        
        counterLabel.text = "\(currentValue)"
       
        
        
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        counterLabel.text = "0"
        historyTextView.text += "\n\(dateFormatter.string(from: Date())): значение сброшено"
    }
    
}


//
//  ViewController.swift
//  Counter
//
//  Created by Kristina Kostenko on 20.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
        historyTextView.text = "История изменений:\n".uppercased()
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        
        historyTextView.layer.borderColor = UIColor.blue.cgColor
        historyTextView.layer.borderWidth = 1.0
    }
    
    
    @IBAction private func plusButtonTapped(_ sender: Any) {
        let currentText = counterLabel.text ?? "0"
        var currentValue = Int(currentText) ?? 0
        
        currentValue += 1
        
        counterLabel.text = "\(currentValue)"
        historyTextView.text += "\n\(dateFormatter.string(from: Date())): значение изменено на +1"
    }
    
    
    @IBAction private func minusButtonTapped(_ sender: Any) {
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
    
    @IBAction private func resetButtonTapped(_ sender: Any) {
        counterLabel.text = "0"
        historyTextView.text += "\n\(dateFormatter.string(from: Date())): значение сброшено"
    }
    
}


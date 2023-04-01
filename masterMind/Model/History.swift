////
////  History.swift
////  masterMind
////
////  Created by Elena Zobak on 3/31/23.
////
//
//import Foundation
//import UIKit
//
//func updateHistory() {
//    // Remove any existing input history views from the view
//    for subview in view.subviews {
//        if subview is UIStackView {
//            subview.removeFromSuperview()
//        }
//    }
//    
//    // Create a new stack view to hold the input history views
//    let historyStackView = UIStackView()
//    historyStackView.axis = .vertical
//    historyStackView.alignment = .leading
//    historyStackView.spacing = 8
//    historyStackView.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(historyStackView)
//    
//    // Add constraints to position the history stack view
//    NSLayoutConstraint.activate([
//        historyStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//        historyStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//    ])
//    
//    // Loop through the history and create a view for each input
//    for inputHistory in inputHistory {
//        let inputView = UIView()
//        inputView.translatesAutoresizingMaskIntoConstraints = false
//        
//        // Create a label to display the input
//        let inputLabel = UILabel()
//        inputLabel.text = inputHistory.userInput
//        inputLabel.font = UIFont.systemFont(ofSize: 20)
//        inputLabel.textColor = .white
//        inputLabel.translatesAutoresizingMaskIntoConstraints = false
//        inputView.addSubview(inputLabel)
//        
//        // Create a label to display the result
//        let resultLabel = UILabel()
//        resultLabel.text = "\(inputHistory.result.0)A \(inputHistory.result.1)B"
//        resultLabel.font = UIFont.systemFont(ofSize: 20)
//        resultLabel.textColor = .white
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        inputView.addSubview(resultLabel)
//        
//        // Add constraints to position the labels within the input view
//        NSLayoutConstraint.activate([
//            inputLabel.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
//            inputLabel.centerYAnchor.constraint(equalTo: inputView.centerYAnchor),
//            resultLabel.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
//            resultLabel.centerYAnchor.constraint(equalTo: inputView.centerYAnchor)
//        ])
//        
//        // Add the input view to the history stack view
//        historyStackView.addArrangedSubview(inputView)
//    }
//}

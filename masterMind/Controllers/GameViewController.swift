//
//  GameViewController.swift
//  masterMind
//
//  Created by Elena Zobak on 3/28/23.
//
import UIKit
import OTPFieldView

class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var codeNumLabel: UILabel! // Delete in the future
    
    @IBOutlet weak var historyStackView: UIStackView!
    // Array to store the user's input history
    var inputHistoryArray: [InputHistory] = [] //var history: [InputHistory] = []
   
    
    var code: String?
    var codeLenght: Int?
    var attempts: String?
    var codeManager = CodeManager()
    // OTPFieldView and stackview to display input fields
    let textStackView = UIStackView()
    // User input field
    let userInputField = UITextField()
    // Button to submit user input
    let submitButton = UIButton(type: .system)
    // Variable to store user input
    var userInputCode = ""
    var nextLabelIndex = 0
    
    
    
  
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
        
        // Fetch the code
        codeManager.delegate = self
        codeManager.fetchWeather(codeLength: codeLenght! )
        
        
    }
    
    // MARK: - Button Actions
    
    @objc func submitButtonTapped() {
        
        // Reset userInputCode to an empty string
        userInputCode = ""
        
        // Loop through each text field in the stack view and append the text from each field to the userInputCode variable
        for case let textField as UITextField in textStackView.arrangedSubviews {
            if let text = textField.text {
                userInputCode.append(text)
                textField.text = ""
            }
            

        }
        
     
        
        // Get the result of checkUserSubmit
        let result = GameLogic.checkUserSubmit(userInputCode: &userInputCode, code: code!)
        
        
        
        // Create a new input history object and add it to the array
        let inputHistoryItem = InputHistory(userInput: userInputCode, result: result)
        
        print("inputHistoryItem.u:  \(inputHistoryItem.userInput)")
        print("inputHistoryItem.r:  \(inputHistoryItem.result)")
        inputHistoryArray.append(inputHistoryItem)
        
        //print(inputHistoryArray[0].userInput)
        
        for inputHistoryItem in inputHistoryArray {
            print("from inputHistoryArray - User input: \(inputHistoryItem.userInput), Result: \(inputHistoryItem.result)")
        }
        
        // Clear the user's input
        userInputCode = ""
        addHistoryLabelsToStackView()
    }
    
    func addHistoryLabelsToStackView() {
        guard nextLabelIndex < inputHistoryArray.count else {
               // If we've already added all the labels, we can stop adding new ones
               return
           }
           
        // Get the label at the next index
        let historyLabel = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 2))
        historyLabel.text = "\(nextLabelIndex):   \(inputHistoryArray[nextLabelIndex].userInput)         RIGHT loc:\(inputHistoryArray[nextLabelIndex].result.0) ,    WRONG loc:\(inputHistoryArray[nextLabelIndex].result.0)"
        
        
        
        // Create a new stack view with the label as its only arranged subview
           let newStackView = UIStackView(arrangedSubviews: [historyLabel])
        
           
        
           
           // Add the new stack view to the existing stack view
        
        historyStackView.addArrangedSubview(newStackView)
           
           // Update the index variable for the next time this function is called
           nextLabelIndex += 1
        
   
        
       
    }
    
    
    
    //MARK: - Update UI
    
    func updateUI() {
        // Configure the stack view
        textStackView.axis = .horizontal
        textStackView.alignment = .fill
        textStackView.distribution = .fillEqually
        textStackView.spacing = 8 // set spacing between fields
        
        // create text fields and add them to the stack view
        for _ in 1...codeLenght! {
            let textField = UITextField()
            
            // Configure the text field appearance
            textField.backgroundColor = UIColor(red: 0.7, green: 0.85, blue: 1.0, alpha: 1.0) // set background color
            textField.layer.cornerRadius = 15 // make text field round
            textField.layer.borderWidth = 2 // set border width
            textField.layer.borderColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0).cgColor // set border color
            textField.textAlignment = .center // center text horizontally
            textField.keyboardType = .numberPad // set keyboard type to number pad
            textField.textColor = .white // set text color to white
            textField.font = UIFont.systemFont(ofSize: 20) // set font size
            
            textStackView.addArrangedSubview(textField) // add text field to stack view
        }
        
        // Add the stack view to the view controller's view
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textStackView)
        
        // Add constraints to center the stack view horizontally and vertically
        NSLayoutConstraint.activate([
            textStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -250),
            textStackView.widthAnchor.constraint(equalToConstant: 300),
            textStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Configure the submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        
        // Add constraints to center the submit button horizontally and place it below the stack view
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16)
        ])
        
        
    }
    
    // Function to update the input history display
    
    
}

//MARK: - CodeManagerDelegate - for comunicating with GameVC

extension GameViewController: CodeManagerDelegate { // all the code functions
    
    func didUpdateCode(_ codeManager: CodeManager, fetchedCode: String) {
        DispatchQueue.main.async {
            self.codeNumLabel.text = fetchedCode
            self.code = fetchedCode
            
        }
        
    }
    
    func didFailedWithError(error: Error) {
        print(error)
    }
}


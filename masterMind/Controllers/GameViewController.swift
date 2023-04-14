//
//  GameViewController.swift
//  masterMind
//
//  Created by Elena Zobak on 3/28/23.
//
import UIKit
import OTPFieldView
//import AlertPopUp


class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var codeNumLabel: UILabel! // Delete in the future
    
    @IBOutlet weak var historyTableView: UITableView!
    
    // Array to store the user's input history
    var inputHistoryArray: [InputHistoryModel] = [] //var history: [InputHistory] = []
    var gameSettings = GameSettings(code: "", codeLength: 0, attempts: 0)
    var codeManager = CodeManager()
    // OTPFieldView and stackview to display input fields
    let textStackView = UIStackView()
    // User input field
    let userInputField = UITextField()
    // Button to submit user input
    let submitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.08, green: 0.84, blue: 0.76, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 18)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    // Variable to store user input
    var userInputCode = ""
    var textFieldsArray = [UITextField]() // Array to store the text fields
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the stack view
        textStackView.axis = .horizontal
        textStackView.alignment = .fill
        textStackView.distribution = .fillEqually
        textStackView.spacing = 8 // set spacing between fields
        
        // create text fields and add them to the stack view
        for _ in 1...(gameSettings.codeLength) {
            let userInputTextField = UITextField()
            
            // Configure the text field appearance
            userInputTextField.backgroundColor = UIColor(red: 0.7, green: 0.85, blue: 1.0, alpha: 1.0) // set background color
            userInputTextField.layer.cornerRadius = 15 // make text field round
            userInputTextField.layer.borderWidth = 2 // set border width
            userInputTextField.layer.borderColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0).cgColor // set border color
            userInputTextField.textAlignment = .center // center text horizontally
            userInputTextField.keyboardType = .numberPad // set keyboard type to number pad
            userInputTextField.textColor = .white // set text color to white
            userInputTextField.font = UIFont.systemFont(ofSize: 20) // set font size
            userInputTextField.delegate = self
            textFieldsArray.append(userInputTextField)
            textStackView.addArrangedSubview(userInputTextField) // add text field to stack view
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
        
        if let firstTextField = textFieldsArray.first {
            firstTextField.keyboardType = .numberPad
            firstTextField.becomeFirstResponder()
        }
        
        // Configure the submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        
        // Add constraints to center the submit button horizontally and place it below the stack view
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16),
            submitButton.widthAnchor.constraint(equalToConstant: 100), // Set width of playButton to 120
            submitButton.heightAnchor.constraint(equalToConstant: 40), // Set height of playButton to 50
        ])
        
        
        
        // Fetch the code
        codeManager.delegate = self
        codeManager.fetchWeather(codeLength: gameSettings.codeLength, gameSettings: gameSettings )
        
        let nib = UINib(nibName: "HistoryTableViewCell1", bundle: nil)
        historyTableView.register(nib, forCellReuseIdentifier: "HistoryTableViewCell1")
        
        historyTableView.dataSource = self
        historyTableView.separatorStyle = .none
        // Create a custom back button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        
        // Set the back button as the left item of the navigation item
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Button Actions
    
    @objc func submitButtonTapped() {
        if inputHistoryArray.count >= gameSettings.attempts - 1 {
            
            let alertPopUp = AlertPopUpLayer()
            alertPopUp.appear(sender: self)
        }
        
        // Reset userInputCode to an empty string
        userInputCode = ""
        
        // Loop through each text field in the stack view and append the text from each field to the userInputCode variable
        for case let codeTextField as UITextField in textStackView.arrangedSubviews {
            if let text = codeTextField.text {
                userInputCode.append(text)
                codeTextField.text = ""
            }
        }
        
        // Get the result of checkUserSubmit
        let result = GameLogic.checkUserSubmit(userInputCode: &userInputCode, code: gameSettings.code)
        
        // Create a new input history object and add it to the array
        let inputHistoryItem = InputHistoryModel(userInput: userInputCode, result: result)
        
        inputHistoryArray.append(inputHistoryItem)
        
        historyTableView.reloadData()
        
        for inputHistoryItem in inputHistoryArray {
            print("from inputHistoryArray - User input: \(inputHistoryItem.userInput), numAndLoc: \(inputHistoryItem.numAndLocation), onlyNum: \(inputHistoryItem.onlyNum)")
        }
        
        // Clear the user's input
        userInputCode = ""
        // Set the first text field as the first responder and show the number pad keyboard
        if let firstTextField = textFieldsArray.first {
            firstTextField.keyboardType = .numberPad
            firstTextField.becomeFirstResponder()
        }
    }
    
    // Function to update the input history display
}

//MARK: - CodeManagerDelegate - for comunicating with GameVC

extension GameViewController: CodeManagerDelegate { // all the code functions
    
    func didUpdateCode(_ codeManager: CodeManager, fetchedCode: String, gameSettings: GameSettings) {
        self.gameSettings.code = fetchedCode // Set the gameSettings.code property to the fetched code
        print("Fetched code: \(fetchedCode)")
        // ...
    }
    func didFailedWithError(error: Error) {
        print(error)
    }
}

//MARK: - history Table View DataSource
extension GameViewController: UITableViewDataSource { // extend GameViewController to conform to the UITableViewDataSource protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // required method that returns the number of rows in the table view
        return inputHistoryArray.count // returns the count of items in the inputHistoryArray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // required method that creates and configures cells for the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell1", for: indexPath) as! HistoryTableViewCell1 // dequeue a reusable cell with the identifier "HistoryTableViewCell1"
        let inputHistoryItem = inputHistoryArray[indexPath.row] // retrieve the corresponding input history item for the current row
        // set the textLabel of the cell to display the user input and corresponding number and location data from the inputHistoryItem
        cell.leftTextLabel.text = inputHistoryItem.userInput
        cell.rightTextLabel.text = ("\(inputHistoryItem.numAndLocation),\(inputHistoryItem.onlyNum)")
        
        return cell // return the configured cell
    }
}



//MARK: - UIText Delegate

extension GameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Check if the replacement string is a valid digit (0-9)
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let replacementStringIsValid = string.rangeOfCharacter(from: allowedCharacters.inverted) == nil
        
        // Check if the new text length is <= 1
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let newTextIsValid = newText.count <= 1
        
        // If both conditions are met, move to the next text field and update the text
        if replacementStringIsValid && newTextIsValid {
            textField.text = newText // manually update the text
            // Delay the focus change to allow the text field to update its text
            if !newText.isEmpty {
                DispatchQueue.main.async {
                    textField.resignFirstResponder()
                    if let nextTextField = self.getNextTextField(from: textField) {
                        nextTextField.becomeFirstResponder()
                    }
                }
            }
        }
        
        // Always return false to prevent the text from being updated automatically
        return false
    }
    
    private func getNextTextField(from textField: UITextField) -> UITextField? {
        if let currentIndex = textFieldsArray.firstIndex(of: textField), currentIndex < textFieldsArray.count - 1 {
            return textFieldsArray[currentIndex + 1]
        }
        return nil
    }
}


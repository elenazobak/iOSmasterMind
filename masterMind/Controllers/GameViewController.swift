//
//  GameViewController.swift
//  masterMind
//
//  Created by Elena Zobak on 3/28/23.
//
import UIKit
import OTPFieldView
//import AlertPopUp
protocol AlertPopUpDelegate: AnyObject {
    func goToHome()
}

class GameViewController: UIViewController, AlertPopUpDelegate {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func goToHome() {
        
        self.dismiss(animated: true, completion: {
            // Dismiss the presenting view controller (i.e., GameViewController)
            // self.navigationController?.popViewController(animated: true)
        })
    }
    
    // MARK: - Properties
    
    var result = (0,0)
    
    // Define outlets for the labels
    let guessTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 16) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x13d6c2) // Set text color to #273c75
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 15.5) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x263c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    @IBOutlet weak var historyTableView: UITableView!
    
    // Array to store the user's input history
    var inputHistoryArray: [InputHistoryModel] = [] //var history: [InputHistory] = []
    var gameSettings = GameSettings(code: "", codeLength: 0, attempts: 0)
    
    var attemptsForDisplay = 0
    
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
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 22)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let clueIcon = UIImage(systemName: "questionmark.circle")?.withTintColor(UIColor(hex: 0x13d6c2), renderingMode: .alwaysOriginal).withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
    // Use .withTintColor(_:renderingMode:) to set the color and rendering mode of the icon
    let clueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    // Variable to store user input
    var userInputCode = ""
    var textFieldsArray = [UITextField]() // Array to store the text fields
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: 0xc8f4f9)
        // Set up initial view properties
        attemptsForDisplay = gameSettings.attempts
        guessTitleLabel.text = "Try to guess \(gameSettings.codeLength) digit code"
        guessTitleLabel.text = guessTitleLabel.text?.uppercased()
        attemptsLeftLabel.text = "Attempts: \(attemptsForDisplay)"
        
        // Add title and attempts labels to the view
        view.addSubview(guessTitleLabel)
        view.addSubview(attemptsLeftLabel)
        
        // Set up text stack view
        textStackView.axis = .horizontal
        textStackView.alignment = .fill
        textStackView.distribution = .fillEqually
        textStackView.spacing = 8
        
        // Add text fields to the stack view
        for _ in 1...gameSettings.codeLength {
            let userInputTextField = UITextField()
            
            // Configure text field appearance
            userInputTextField.backgroundColor = .white
            userInputTextField.layer.cornerRadius = 15
            //userInputTextField.layer.borderWidth = 5
            userInputTextField.layer.borderColor = UIColor(hex: 0xb0f3fa).cgColor
            userInputTextField.textAlignment = .center
            userInputTextField.keyboardType = .numberPad
            userInputTextField.textColor = UIColor(hex: 0x43c5e5)
            userInputTextField.font = UIFont(name: "Futura-Bold", size: 20)
            let dummyInputAccessoryView = UIView()
            userInputTextField.inputAccessoryView = dummyInputAccessoryView
            userInputTextField.delegate = self
            textFieldsArray.append(userInputTextField)
            textStackView.addArrangedSubview(userInputTextField)
        }
        
        // Add stack view to the view
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textStackView)
        
        // Set up constraints for text stack view
        NSLayoutConstraint.activate([
            textStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -230),
            textStackView.widthAnchor.constraint(equalToConstant: 300),
            textStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Set up constraints for title and attempts labels
        NSLayoutConstraint.activate([
            guessTitleLabel.topAnchor.constraint(equalTo: textStackView.topAnchor, constant: -40),
            guessTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            attemptsLeftLabel.bottomAnchor.constraint(equalTo: guessTitleLabel.topAnchor, constant: -15),
            attemptsLeftLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            //attemptsLeftLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Set up first text field and keyboard type
        if let firstTextField = textFieldsArray.first {
            firstTextField.keyboardType = .numberPad
            firstTextField.becomeFirstResponder()
        }
        
        // Set up submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        
        // Set up constraints for submit button
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 20),
            submitButton.widthAnchor.constraint(equalToConstant: 120),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        // Set the delegate for the code manager to this view controller
        codeManager.delegate = self
        
        // Fetch the code with the specified code length and game settings using the code manager
        codeManager.fetchWeather(codeLength: gameSettings.codeLength, gameSettings: gameSettings )
        
        // Register the nib file for the history table view cell
        let nib = UINib(nibName: "HistoryTableViewCell1", bundle: nil)
        historyTableView.register(nib, forCellReuseIdentifier: "HistoryTableViewCell1")
        
        // Set the data source for the history table view to this view controller
        historyTableView.dataSource = self
        historyTableView.separatorStyle = .none
        historyTableView.rowHeight = 50.0
        if #available(iOS 11.0, *) {
            historyTableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        // Create a custom back button for the navigation bar
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 15)!], for: .normal)
        
        // Set the back button as the left item of the navigation item
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Button Actions
    
    @objc func submitButtonTapped() {
    
        if attemptsForDisplay == 0 {
            let alert = UIAlertController(title: "Error", message: "Sorry, no more attempts", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        // Reset userInputCode to an empty string
        userInputCode = ""
        
        // Loop through each text field in the stack view and append the text from each field to the userInputCode variable
        for case let codeTextField as UITextField in textStackView.arrangedSubviews {
            if let text = codeTextField.text {
                userInputCode.append(text)
            }
        }
        
        // Check if entered code length is not equal to codelength
        if userInputCode.count != gameSettings.codeLength {
            // Show alert with error message
            let alert = UIAlertController(title: "Error", message: "Please enter \(gameSettings.codeLength) digits", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        
        attemptsForDisplay -= 1
        attemptsLeftLabel.text = "Attempts: \(attemptsForDisplay)"
        
        
        // Get the result of checkUserSubmit
        result = GameLogic.checkUserSubmit(userInputCode: &userInputCode, code: gameSettings.code)
        
        // IF Won ***
        
        if result.0 == gameSettings.codeLength {
            
            // Create an instance of AlertPopUpLayer
            let alertPopUp = AlertPopUpLayer()
            // Set the code value to be passed to AlertPopUpLayer
            alertPopUp.setAlertTitle("Good Job!")
            alertPopUp.setMessage("You did it! The number is \(gameSettings.code)")
            // Set the delegate
            alertPopUp.delegate = self
            // Present AlertPopUpLayer
            alertPopUp.appear(sender: self)
            attemptsForDisplay = 0
            
            
        } else if inputHistoryArray.count >= gameSettings.attempts - 1 {
            
            // Create an instance of AlertPopUpLayer
            let alertPopUp = AlertPopUpLayer()
            
            // Set the code value to be passed to AlertPopUpLayer
            // alertPopUp.fetchedCode = self.gameSettings.code
            alertPopUp.setAlertTitle("Game Over!")
            alertPopUp.setMessage("The number was \(gameSettings.code)")
            // Set the delegate
            //  alertPopUp.delegate = self // for go to home function to work
            alertPopUp.appear(sender: self)
            textFieldsArray[0].resignFirstResponder()
        } else { // if not win or game over, empty text fields
            for case let codeTextField as UITextField in textStackView.arrangedSubviews {
                if let text = codeTextField.text {
                    codeTextField.text = ""
                }
            }
            if let firstTextField = textFieldsArray.first {
                firstTextField.keyboardType = .numberPad
                firstTextField.becomeFirstResponder()
            }
        }
        
        // Create a new input history object and add it to the array
        let inputHistoryItem = InputHistoryModel(userInput: userInputCode, result: result)
        
        // Insert the new item at the beginning of the array
        inputHistoryArray.insert(inputHistoryItem, at: 0)
        
        historyTableView.reloadData()
        
        // Clear the user's input
        userInputCode = ""
        
        
        // ClueButton
        
        clueButton.setImage(clueIcon, for: .normal)
        clueButton.addTarget(self, action: #selector(showClue(_:)), for: .touchUpInside)
        view.addSubview(clueButton)
        
        NSLayoutConstraint.activate([
            clueButton.topAnchor.constraint(equalTo: historyTableView.topAnchor, constant: 10),
            clueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
        ])
    }
    
    @IBAction func showClue(_ sender: UIButton) {
        
        let cluePopUp = CluePopUp()
        // Configure the popup view controller if needed
        
        cluePopUp.setNumandLocLabel("\(result.0) correct numbers in correct place,")
        cluePopUp.setOnlyNumLabel("\(result.1) correct numbers in wrong place")
        // present(cluePopUp, animated: true, completion: nil)
        cluePopUp.appear(sender: self)
        
    }
}

//MARK: - CodeManagerDelegate - for comunicating with GameVC

extension GameViewController: CodeManagerDelegate { // all the code functions
    
    func didUpdateCode(_ codeManager: CodeManager, fetchedCode: String, gameSettings: GameSettings) {
        self.gameSettings.code = fetchedCode // Set the gameSettings.code property to the fetched code
       // print("Fetched code: \(fetchedCode)")
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
        cell.rightTextLabel1.text = ("\(inputHistoryItem.numAndLocation),")
        cell.rightTextLabel2.text = ("\(inputHistoryItem.onlyNum)")
        
        return cell // return the configured cell
    }
}



//MARK: - UIText Delegate

extension GameViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: NSRange(location: currentText.count - 1, length: 1), with: "")
        
        if newText.isEmpty {
            textField.resignFirstResponder()
            if let previousTextField = self.getPreviousTextField(from: textField) {
                previousTextField.becomeFirstResponder()
            }
            return false
        }
        
        return true
    }
    
    
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
    
    private func getPreviousTextField(from textField: UITextField) -> UITextField? {
        if let currentIndex = textFieldsArray.firstIndex(of: textField), currentIndex > 0 {
            return textFieldsArray[currentIndex - 1]
        }
        return nil
    }
    
    private func getNextTextField(from textField: UITextField) -> UITextField? {
        if let currentIndex = textFieldsArray.firstIndex(of: textField), currentIndex < textFieldsArray.count - 1 {
            return textFieldsArray[currentIndex + 1]
        }
        return nil
    }
}

import UIKit

class HomeViewController: UIViewController {
    
    var attempts = 10
    var codeLength = 4
    // Declare UI elements
    
    
    let attemptsLabel: UILabel = {
        let label = UILabel()
        label.text = "Attempts:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let subtractButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let attemptsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var attemptsCount = 0 {
        didSet {
            attemptsCountLabel.text = "\(attemptsCount)"
        }
    }
    
    let codeLengthLabel: UILabel = {
            let label = UILabel()
            label.text = "Code Length:"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let codeLengthCountLabel: UILabel = {
            let label = UILabel()
            label.text = "4"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let codeLengthAddButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
            button.tintColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let codeLengthSubtractButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
            button.tintColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let codeLengthView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 10
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        var codeLengthCount = 4 {
            didSet {
                codeLengthCountLabel.text = "\(codeLengthCount)"
            }
        }
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        
        // Add title label
        let titleLabel = UILabel()
        titleLabel.text = "Numwix"
        titleLabel.font = UIFont(name: "Futura-bold", size: 50)
        titleLabel.textColor = .white
//        titleLabel.shadowColor = UIColor(red: 0.17, green: 0.35, blue: 0.29, alpha: 0.60)
//        titleLabel.shadowOffset = CGSize(width: -2, height: 3)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Add bulb image
        let bulbImage = UIImage(named: "bulb")
        let bulbImageView = UIImageView(image: bulbImage)
        bulbImageView.contentMode = .scaleAspectFit
        bulbImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bulbImageView)
        
        NSLayoutConstraint.activate([
            bulbImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bulbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bulbImageView.widthAnchor.constraint(equalToConstant: 100),
            bulbImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Set up attempts label and buttons
        
        // Create the horizontal stack view
        let stackView = UIStackView(arrangedSubviews: [attemptsLabel, subtractButton, attemptsCountLabel, addButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center

        // Add the stack view to the attempts view
        attemptsView.addSubview(stackView)
        
        
        view.addSubview(attemptsView)
       // attemptsView.addSubview(attemptsLabel)
        
       // attemptsView.addSubview(addButton)
       // attemptsView.addSubview(attemptsCountLabel)
       // attemptsView.addSubview(subtractButton)
        
        // Set the constraints for the attempts view
        NSLayoutConstraint.activate([
            attemptsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            attemptsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            attemptsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            attemptsView.heightAnchor.constraint(equalToConstant: 60),
        ])

        // Set the constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: attemptsView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: attemptsView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: attemptsView.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: attemptsView.heightAnchor)
        ])
        
        addButton.addTarget(self, action: #selector(addAttempt), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(subtractAttempt), for: .touchUpInside)
        
        // Create the horizontal stack view for code length
        let codeLengthStackView = UIStackView(arrangedSubviews: [codeLengthLabel, codeLengthSubtractButton, codeLengthCountLabel, codeLengthAddButton])
        codeLengthStackView.translatesAutoresizingMaskIntoConstraints = false
        codeLengthStackView.axis = .horizontal
        codeLengthStackView.distribution = .equalSpacing
        codeLengthStackView.alignment = .center

        // Add the stack view to the code length view
        codeLengthView.addSubview(codeLengthStackView)

        // Add the code length view to the main view
        view.addSubview(codeLengthView)

        // Set the constraints for the code length view
        NSLayoutConstraint.activate([
            codeLengthView.topAnchor.constraint(equalTo: attemptsView.bottomAnchor, constant: 30),
            codeLengthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            codeLengthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            codeLengthView.heightAnchor.constraint(equalToConstant: 60),
        ])

        // Set the constraints for the stack view for code length
        NSLayoutConstraint.activate([
            codeLengthStackView.centerYAnchor.constraint(equalTo: codeLengthView.centerYAnchor),
            codeLengthStackView.centerXAnchor.constraint(equalTo: codeLengthView.centerXAnchor),
            codeLengthStackView.widthAnchor.constraint(equalTo: codeLengthView.widthAnchor, multiplier: 0.8),
            codeLengthStackView.heightAnchor.constraint(equalTo: codeLengthView.heightAnchor)
        ])

        // Add targets for the buttons
        codeLengthAddButton.addTarget(self, action: #selector(codeLengthAddButtonTapped), for: .touchUpInside)

        codeLengthSubtractButton.addTarget(self, action: #selector(codeLengthSubtractButtonTapped), for: .touchUpInside)
        
        let playButton = UIButton(type: .custom)
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.backgroundColor = UIColor(red: 0.08, green: 0.84, blue: 0.76, alpha: 1.0) // Teal color
        playButton.layer.cornerRadius = 20 // Set corner radius to create an oval shape
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        playButton.contentHorizontalAlignment = .center
        playButton.contentVerticalAlignment = .center
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)

        view.addSubview(playButton)

        // Add constraints for positioning the play button
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: codeLengthSubtractButton.bottomAnchor, constant: 80),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc func addAttempt() {
        if attemptsCount < 12 {
            attemptsCount += 1
        }
    }
    
    @objc func subtractAttempt() {
        if attemptsCount > 0 {
            attemptsCount -= 1
        }
    }
    @objc func codeLengthAddButtonTapped() {
        codeLengthCount += 1
    }

    @objc func codeLengthSubtractButtonTapped() {
        if codeLengthCount > 1 {
            codeLengthCount -= 1
        }
    }
    
    @objc func playButtonTapped() {
        // Perform segue to GameViewController and pass attempts and codeLength values
            performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    // Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            if let gameViewController = segue.destination as? GameViewController {
                // Pass attempts and codeLength values to GameViewController
                gameViewController.gameSettings = GameSettings(code: "", codeLength: codeLengthCount, attempts: attemptsCount)
            }
        }
    }
}

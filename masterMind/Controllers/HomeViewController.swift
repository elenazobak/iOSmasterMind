import UIKit

class HomeViewController: UIViewController {
    
    let smallButtonsSize: CGFloat = 40
    let buttonCornerRadius: CGFloat = 20
    
    let attemptsLabel: UILabel = {
        let label = UILabel()
        label.text = "Attempts:"
        label.font = UIFont(name: "Futura-Bold", size: 18) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "6"
        label.font = UIFont(name: "Futura", size: 23) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 24) // Set font to Futura-Bold with size 24
        button.setTitleColor(.white, for: .normal) // Set text color to white
        button.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
   
        button.layer.masksToBounds = true
        // Set content vertical alignment to center
        button.contentVerticalAlignment = .center
        // Set content horizontal alignment to center
        button.contentHorizontalAlignment = .center
        return button
    }()

    let attemptsSubtractButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 24) // Set font to Futura-Bold with size 24
        button.setTitleColor(.white, for: .normal) // Set text color to white
        button.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        // Increase width and height constraints
        // Set corner radius to half of width
     
        button.layer.masksToBounds = true
        // Set content vertical alignment to center
        button.contentVerticalAlignment = .center
        // Set content horizontal alignment to center
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let attemptsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var attemptsCount = 6 {
        didSet {
            attemptsCountLabel.text = "\(attemptsCount)"
        }
    }
    
    let codeLengthLabel: UILabel = {
        let label = UILabel()
        label.text = "Code Length:"
        label.font = UIFont(name: "Futura-Bold", size: 18) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let codeLengthCountLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = UIFont(name: "Futura", size: 23) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let codeLengthAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 24) // Set font to Futura-Bold with size 24
        button.setTitleColor(.white, for: .normal) // Set text color to white
        button.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        // Increase width and height constraints
        // Set corner radius to half of width
      
        button.layer.masksToBounds = true
        // Set content vertical alignment to center
        button.contentVerticalAlignment = .center
        // Set content horizontal alignment to center
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let codeLengthSubtractButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 24) // Set font to Futura-Bold with size 24
        button.setTitleColor(.white, for: .normal) // Set text color to white
        button.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        // Increase width and height constraints
    
        button.layer.masksToBounds = true
        // Set content vertical alignment to center
        button.contentVerticalAlignment = .center
        // Set content horizontal alignment to center
        button.contentHorizontalAlignment = .center
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
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.08, green: 0.84, blue: 0.76, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 22)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Add title label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Numwiz"
        label.font = UIFont(name: "Futura-bold", size: 50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        
        attemptsAddButton.widthAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        attemptsAddButton.heightAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        attemptsSubtractButton.heightAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        attemptsSubtractButton.widthAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        codeLengthAddButton.widthAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        codeLengthAddButton.heightAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        codeLengthSubtractButton.widthAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        codeLengthSubtractButton.heightAnchor.constraint(equalToConstant: smallButtonsSize).isActive = true
        
        attemptsAddButton.layer.cornerRadius = buttonCornerRadius
        attemptsSubtractButton.layer.cornerRadius = buttonCornerRadius
        codeLengthAddButton.layer.cornerRadius = buttonCornerRadius
        codeLengthSubtractButton.layer.cornerRadius = buttonCornerRadius
        
        view.addSubview(playButton)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Add bulb image
        let bulbImage = UIImage(named: "bulb")
        let bulbImageView = UIImageView(image: bulbImage)
        bulbImageView.contentMode = .scaleAspectFit
        bulbImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bulbImageView)
        
        NSLayoutConstraint.activate([
            bulbImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            bulbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bulbImageView.widthAnchor.constraint(equalToConstant: 100),
            bulbImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Create the horizontal stack view for attempts
        let attemptsStackView = UIStackView(arrangedSubviews: [attemptsLabel, attemptsSubtractButton, attemptsCountLabel, attemptsAddButton])
        attemptsStackView.translatesAutoresizingMaskIntoConstraints = false
        attemptsStackView.axis = .horizontal
        attemptsStackView.spacing = 4
        attemptsStackView.distribution = .equalSpacing
        attemptsStackView.alignment = .center
        
        // Add the stack view to the attempts view
        attemptsView.addSubview(attemptsStackView)
        view.addSubview(attemptsView)
      
        // Set the constraints for the stack view for attempts
        NSLayoutConstraint.activate([
            attemptsStackView.centerYAnchor.constraint(equalTo: attemptsView.centerYAnchor),
            attemptsStackView.centerXAnchor.constraint(equalTo: attemptsView.centerXAnchor),
            attemptsStackView.widthAnchor.constraint(equalTo: attemptsView.widthAnchor, multiplier: 0.8),
            attemptsStackView.heightAnchor.constraint(equalTo: attemptsView.heightAnchor)
        ])

        //**CodeLengh
        // Create the horizontal stack view for code length
        // Create the horizontal stack view for code length
        let codeLengthStackView = UIStackView(arrangedSubviews: [codeLengthLabel, codeLengthSubtractButton, codeLengthCountLabel, codeLengthAddButton])
        codeLengthStackView.translatesAutoresizingMaskIntoConstraints = false
        codeLengthStackView.axis = .horizontal
        codeLengthStackView.distribution = .equalSpacing
        codeLengthStackView.alignment = .center

        // Add the stack view to the code length view
        codeLengthView.addSubview(codeLengthStackView)
        view.addSubview(codeLengthView)
        
        // Set the constraints for the stack view for code length
        NSLayoutConstraint.activate([
            codeLengthStackView.centerYAnchor.constraint(equalTo: codeLengthView.centerYAnchor),
            codeLengthStackView.centerXAnchor.constraint(equalTo: codeLengthView.centerXAnchor),
            codeLengthStackView.widthAnchor.constraint(equalTo: codeLengthView.widthAnchor, multiplier: 0.8),
            codeLengthStackView.heightAnchor.constraint(equalTo: codeLengthView.heightAnchor)
        ])
        
     // Add targets for the buttons
        attemptsAddButton.addTarget(self, action: #selector(addAttempt), for: .touchUpInside)
        attemptsSubtractButton.addTarget(self, action: #selector(subtractAttempt), for: .touchUpInside)
        codeLengthAddButton.addTarget(self, action: #selector(codeLengthAddButtonTapped), for: .touchUpInside)
        codeLengthSubtractButton.addTarget(self, action: #selector(codeLengthSubtractButtonTapped), for: .touchUpInside)
   
        setupConstraints()
    
    }
    
    func setupConstraints() {
                
        // Add constraints for positioning the play button
        NSLayoutConstraint.activate([
            
            // Position playButton below codeLengthSubtractButton with a top spacing of 100
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: codeLengthSubtractButton.bottomAnchor, constant: 100),
            // Set width of playButton to 120
            playButton.widthAnchor.constraint(equalToConstant: 120),
            // Set height of playButton to 50
            playButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Position codeLengthView below attemptsView with a top spacing of 30
            codeLengthView.topAnchor.constraint(equalTo: attemptsView.bottomAnchor, constant: 30),
            // Position codeLengthView leading edge to view's leading edge with a spacing of 40
            codeLengthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            // Position codeLengthView trailing edge to view's trailing edge with a spacing of -40
            codeLengthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // Set height of codeLengthView to 60
            codeLengthView.heightAnchor.constraint(equalToConstant: 60),
            
            // Position codeLengthSubtractButton leading edge to codeLengthLabel's trailing edge with a spacing of 10
            codeLengthSubtractButton.leadingAnchor.constraint(equalTo: codeLengthLabel.trailingAnchor, constant: 5),
            // Center codeLengthSubtractButton vertically in codeLengthView
            codeLengthSubtractButton.centerYAnchor.constraint(equalTo: codeLengthView.centerYAnchor),
            
            // Center attemptsView vertically in view
            attemptsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // Position attemptsView leading edge to view's leading edge with a spacing of 40
            attemptsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            // Position attemptsView trailing edge to view's trailing edge with a spacing of -40
            attemptsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // Set height of attemptsView to 60
            attemptsView.heightAnchor.constraint(equalToConstant: 60),
            
            // Position attemptsSubtractButton leading edge to attemptsLabel's trailing edge with a spacing of 10
            attemptsSubtractButton.leadingAnchor.constraint(equalTo: attemptsLabel.trailingAnchor, constant: 10),
            //codeLengthSubtractButton.centerXAnchor.constraint(equalTo: attemptsSubtractButton.centerXAnchor),
           // codeLengthAddButton.centerXAnchor.constraint(equalTo: attemptsAddButton.centerXAnchor),
           // codeLengthCountLabel.widthAnchor.constraint(equalTo: attemptsCountLabel.widthAnchor),
            codeLengthCountLabel.centerXAnchor.constraint(equalTo: attemptsCountLabel.centerXAnchor),
           
        
        
        ])
    }
    
    
    @objc func addAttempt() {
        if attemptsCount < 15 {
            attemptsCount += 1
        }
    }
    
    @objc func subtractAttempt() {
        if attemptsCount > 1 {
            attemptsCount -= 1
        }
    }
    @objc func codeLengthAddButtonTapped() {
        if codeLengthCount < 7 {
            codeLengthCount += 1
        }
    }
    
    @objc func codeLengthSubtractButtonTapped() {
        if codeLengthCount > 3 {
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
                print (gameViewController.gameSettings)
            }
        }
    }
}


extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xff) / 255.0
        let green = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

import UIKit

class HomeViewController: UIViewController {
    
   
    
    
    let attemptsLabel: UILabel = {
        let label = UILabel()
        label.text = "Attempts:"
        label.font = UIFont(name: "Futura-Bold", size: 20) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "6"
        label.font = UIFont(name: "Futura-Bold", size: 23) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attemptsAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor(red: 0.69, green: 0.95, blue: 0.98, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let attemptsSubtractButton: UIButton = {
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
        label.font = UIFont(name: "Futura-Bold", size: 20) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let codeLengthCountLabel: UILabel = {
            let label = UILabel()
            label.text = "4"
            label.font = UIFont(name: "Futura-Bold", size: 23) // Use Futura-Bold font with size 20
            label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
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
        
        // Set up attempts label and buttons
        
        // Create the horizontal stack view
        let attemptsStackView = UIStackView(arrangedSubviews: [attemptsLabel, attemptsSubtractButton, attemptsCountLabel, attemptsAddButton])
        attemptsStackView.translatesAutoresizingMaskIntoConstraints = false
        attemptsStackView.axis = .horizontal
        attemptsStackView.distribution = .equalSpacing
        attemptsStackView.alignment = .center

        // Add the stack view to the attempts view
        attemptsView.addSubview(attemptsStackView)
        
        
        view.addSubview(attemptsView)
       
        
        // Set the constraints for the attempts view
        NSLayoutConstraint.activate([
            attemptsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            attemptsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            attemptsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            //attemptsView.widthAnchor.constraint(equalToConstant: 150),
            attemptsView.heightAnchor.constraint(equalToConstant: 60),
            attemptsSubtractButton.leadingAnchor.constraint(equalTo: attemptsLabel.trailingAnchor, constant: 10),
            attemptsSubtractButton.centerYAnchor.constraint(equalTo: attemptsLabel.centerYAnchor),
        ])

        // Set the constraints for the stack view
        NSLayoutConstraint.activate([
            attemptsStackView.centerYAnchor.constraint(equalTo: attemptsView.centerYAnchor),
            attemptsStackView.centerXAnchor.constraint(equalTo: attemptsView.centerXAnchor),
            attemptsStackView.widthAnchor.constraint(equalTo: attemptsView.widthAnchor, multiplier: 0.8),
            attemptsStackView.heightAnchor.constraint(equalTo: attemptsView.heightAnchor)
        ])
        
        attemptsAddButton.addTarget(self, action: #selector(addAttempt), for: .touchUpInside)
        attemptsSubtractButton.addTarget(self, action: #selector(subtractAttempt), for: .touchUpInside)
        
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

        

        // Set the constraints for the stack view for code length
        NSLayoutConstraint.activate([
            codeLengthStackView.centerYAnchor.constraint(equalTo: codeLengthView.centerYAnchor),
            codeLengthStackView.centerXAnchor.constraint(equalTo: codeLengthView.centerXAnchor),
            codeLengthStackView.widthAnchor.constraint(equalTo: codeLengthView.widthAnchor, multiplier: 0.8),
            codeLengthStackView.heightAnchor.constraint(equalTo: codeLengthView.heightAnchor)
        ])
        // Set the constraints for the code length view
        NSLayoutConstraint.activate([
            codeLengthView.topAnchor.constraint(equalTo: attemptsView.bottomAnchor, constant: 30),
            codeLengthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            codeLengthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            codeLengthView.heightAnchor.constraint(equalToConstant: 60),
            codeLengthSubtractButton.leadingAnchor.constraint(equalTo: codeLengthLabel.trailingAnchor, constant: 10),
                codeLengthSubtractButton.centerYAnchor.constraint(equalTo: codeLengthView.centerYAnchor),
        ])
        
        

        // Add targets for the buttons
        codeLengthAddButton.addTarget(self, action: #selector(codeLengthAddButtonTapped), for: .touchUpInside)

        codeLengthSubtractButton.addTarget(self, action: #selector(codeLengthSubtractButtonTapped), for: .touchUpInside)
        
        let playButton = UIButton(type: .custom)
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.backgroundColor = UIColor(red: 0.08, green: 0.84, blue: 0.76, alpha: 1.0) // Teal color
        playButton.layer.cornerRadius = 25 // Set corner radius to create an oval shape
        playButton.titleLabel?.font = UIFont(name: "Futura-Bold", size: 22)
        playButton.contentHorizontalAlignment = .center
        playButton.contentVerticalAlignment = .center
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)

        view.addSubview(playButton)

        // Add constraints for positioning the play button
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: codeLengthSubtractButton.bottomAnchor, constant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            playButton.heightAnchor.constraint(equalToConstant: 50)
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

import UIKit


class AlertPopUpLayer: UIViewController {
    
    
           
            
    weak var delegate: AlertPopUpDelegate?
    

    // Create UI elements programmatically
    let contantView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.alpha = 0
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.08, green: 0.84, blue: 0.76, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 16)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
       // label.text = "Game Over!"
        label.font = UIFont(name: "Futura-Bold", size: 20) // Use Futura-Bold font with size 20
        label.textColor = UIColor(hex: 0x273c75) // Set text color to #273c75
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = UIColor(hex: 0x273c75)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        hide()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // Call the delegate method
            self.delegate?.goToHome()
        }
    }
    
    // Initializing the view controller.
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    // Required initializer when using storyboards, but since this view controller is initialized programmatically, it is not used.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configuring the view after it has loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configView()
        closeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    // A private function to configure the appearance of the views.
    private func configView() {
        self.view.backgroundColor = .clear
        
        // Add subviews
        self.view.addSubview(backView)
        self.view.addSubview(contantView)
        contantView.addSubview(closeButton)
        contantView.addSubview(titleLabel)
        contantView.addSubview(messageLabel)
        
        // Set constraints for backView
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // Set constraints for contantView
        NSLayoutConstraint.activate([
            contantView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contantView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contantView.widthAnchor.constraint(equalToConstant: 300),
            contantView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        // Set constraints for closeButton
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: contantView.centerXAnchor),
            closeButton.bottomAnchor.constraint(equalTo: contantView.bottomAnchor, constant: -40),
            closeButton.widthAnchor.constraint(equalToConstant: 120), // Set width of playButton to 120
            closeButton.heightAnchor.constraint(equalToConstant: 40), // Set height of playButton to 50
            
        ])
        
        // Set constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contantView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contantView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contantView.trailingAnchor, constant: -16),
        ])
        
        // Set constraints for messageLabel
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: contantView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: contantView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -16),
        ])
    }
    
    // Show the popup view
    func show() {
        UIView.animate(withDuration: 0.3) {
            self.backView.alpha = 1
        }
    }
    
    // Hide the popup view
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backView.alpha = 0
        }) { (completed) in
            if completed {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    
    // A function to present the overlay view controller from another view controller.
       func appear(sender: UIViewController) {
           sender.present(self, animated: false) {
               self.show()
           }
       }
    func setAlertTitle(_ title: String) {
            titleLabel.text = title
        }
    
    func setMessage(_ message: String) {
        messageLabel.text = message
    }
    
}

//
//  CluePopUp.swift
//  masterMind
//
//  Created by Elena Zobak on 4/20/23.
//

import UIKit

class CluePopUp: UIViewController {
    
    var numAndLocation = 0
    var onlyNum = 0
    
    
    // Create UI elements programmatically
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: 0x80dcf3) //#D4FAFC
        view.layer.cornerRadius = 10
        
        // Add shadow to the contentView
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.1
            view.layer.shadowRadius = 5
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    let upperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //let xmarkIcon = UIImage(systemName: "xmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "delete-icon"), for: .normal) // Set custom image for X button
        
        button.setTitle("ok", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.layer.cornerRadius = 15
        // set corner radius to half of the smaller dimension
        return button
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        //label.text = "You have 2 numbers on the right location" // Update label text and color
        label.font = UIFont(name: "Futura-bold", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 2
       // label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let whiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
       // label.text = "You have 2 numbers on the right location" // Update label text and color
        label.font = UIFont(name: "Futura-bold", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 2
      //  label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
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
      
    }
    
    // A private function to configure the appearance of the views.
    private func configView() {
        self.view.backgroundColor = .clear
        
        // Add subviews
        self.view.addSubview(contentView)
        contentView.addSubview(closeButton)
        contentView.addSubview(upperView)
        contentView.addSubview(bottomView)
        upperView.addSubview(blackLabel)
        bottomView.addSubview(whiteLabel)
        
        // Set constraints for contentView
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 250),
           // contentView.heightAnchor.constraint(equalToConstant: 150)
            contentView.bottomAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 15)
        ])
       
        
        
        // closeButton.setImage(xmarkIcon, for: .normal)
         closeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 2), // Set top constraint to 10 points from top of contentView
            closeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 40), // Set width to 20
           closeButton.heightAnchor.constraint(equalToConstant: 30) // Set height to 20
        ])
        
        // Set constraints for leftView
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: contentView.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            upperView.widthAnchor.constraint(equalTo: contentView.widthAnchor) // Update to set leftView to half the width of contentView
        ])
        
        NSLayoutConstraint.activate([
           bottomView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -20),
            //rightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
           bottomView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
           // rightView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5) // Update to set rightView to half the width of contentView
        ])
        
        // Set constraints for blackLabel
        NSLayoutConstraint.activate([
            blackLabel.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 10),
            blackLabel.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 10),
            blackLabel.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -10),
            blackLabel.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -10),
            blackLabel.widthAnchor.constraint(equalTo: upperView.widthAnchor, constant: -20)
        ])
        
        // Set constraints for whiteLabel
        NSLayoutConstraint.activate([
            whiteLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            whiteLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            whiteLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
            whiteLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10),
            whiteLabel.widthAnchor.constraint(equalTo: bottomView.widthAnchor, constant: -20)
        ])
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        hide()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Call the delegate method
            // self.delegate?.goToHome()
        }
    }
    // Hide the popup view
    func hide() {
        UIView.animate(withDuration: 0.1, animations: {
            self.contentView.alpha = 0
        }) { (completed) in
            if completed {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    // Show the popup view
    func show() {
        UIView.animate(withDuration: 0.1) {
            self.contentView.alpha = 1
        }
    }
    // A function to present the overlay view controller from another view controller.
       func appear(sender: UIViewController) {
           sender.present(self, animated: false) {
               self.show()
           }
       }
    

    func setNumandLocLabel(_ text: String) {
            blackLabel.text = text
        }
    
    func setOnlyNumLabel(_ text: String) {
        whiteLabel.text = text
    }
    
}

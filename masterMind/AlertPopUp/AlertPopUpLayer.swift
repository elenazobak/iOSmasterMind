//
//  AlertPopUpLayer.swift
//  masterMind
//
//  Created by Elena Zobak on 4/4/23.
//

import UIKit

class AlertPopUpLayer: UIViewController {

    // IBOutlets for connecting to UI elements in the storyboard.
    @IBOutlet weak var contantView: UIView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        hide()
    }
    
    // Initializing the view controller with a custom nib file named "OverLayerView" and setting the modalPresentationStyle to .overFullScreen.
    init() {
        super.init(nibName: "AlertPopUpLayer", bundle: nil)
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
        self.backView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.contantView.alpha = 0
        self.contantView.layer.cornerRadius = 10
    }

    // A function to present the overlay view controller from another view controller.
    func appear(sender: GameViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }

    
    // Animates the overlay to show
       private func show() {
           UIView.animate(withDuration: 1, delay: 0.2) {
               self.backView.alpha = 1 // Set the alpha of the background view to 1
               self.contantView.alpha = 1 // Set the alpha of the content view to 1
           }
       }
       
       // Animates the overlay to hide and removes it from its parent view controller
       func hide() {
           UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
               self.backView.alpha = 0 // Set the alpha of the background view to 0
               self.contantView.alpha = 0 // Set the alpha of the content view to 0
           } completion: { _ in
               self.dismiss(animated: false) // Dismiss the overlay view controller
               self.removeFromParent() // Remove the overlay view controller from its parent view controller
           }
       }
}

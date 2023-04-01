//
//  ViewController.swift
//  masterMind
//
//  Created by Elena Zobak on 3/27/23.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var numOfAttempts: UITextField!
    
    @IBOutlet weak var codeLenght: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.delegate = self
        
        print("emil")
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToGame" {
                let destinationVC = segue.destination as! GameViewController
                destinationVC.attempts = numOfAttempts.text
                destinationVC.codeLenght = Int(codeLenght.text ?? "4")
                
              
            }
        }

}



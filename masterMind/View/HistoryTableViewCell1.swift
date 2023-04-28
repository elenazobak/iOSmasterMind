//
//  HistoryTableViewCell1.swift
//  masterMind
//
//  Created by Elena Zobak on 4/3/23.
//

import UIKit

class HistoryTableViewCell1: UITableViewCell {
    
    // The custom views for the cell
    let leftView = UIView()
    let rightView = UIView()
    let leftTextLabel = UILabel()
    let rightTextLabel1 = UILabel()
    let rightTextLabel2 = UILabel()
    
    // The shadow for the cell
    let shadowView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        // Set up the left view
        leftView.backgroundColor = .white
        leftView.layer.cornerRadius = 10
        contentView.addSubview(leftView)
        
        // Set up the right view
        rightView.backgroundColor = UIColor(hex: 0x43c4e5)
        rightView.layer.cornerRadius = 10
        contentView.addSubview(rightView)
        
        // Set up the shadow view
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 2
        shadowView.layer.shadowOpacity = 0.2
        
        let attributedString = NSMutableAttributedString(string: "333445")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 5.0, range: NSRange(location: 0, length: attributedString.length))

        leftTextLabel.attributedText = attributedString
        leftTextLabel.textColor = UIColor(hex: 0x263c75)
        leftTextLabel.font = UIFont(name: "Futura-Bold", size: 17)
        leftTextLabel.textAlignment = .center
        leftView.addSubview(leftTextLabel)
        
        // Set up the right text labels
        rightTextLabel1.textColor = UIColor.white
        rightTextLabel1.font = UIFont(name: "Futura-Bold", size: 17)
        rightTextLabel1.text = "1,"
        rightTextLabel1.textAlignment = .center
        rightView.addSubview(rightTextLabel1)
        
        rightTextLabel2.textColor = UIColor.white
        rightTextLabel2.font = UIFont(name: "Futura-Bold", size: 17)
        rightTextLabel2.text = "2"
        rightTextLabel2.textAlignment = .center
        rightView.addSubview(rightTextLabel2)
    }
    
    
    override func layoutSubviews() {
           super.layoutSubviews()
           
           // Position the left view and text label
           let leftWidth = contentView.frame.width - contentView.frame.height - 4
           let leftHeight = contentView.frame.height * 0.95
           leftView.frame = CGRect(x: 0, y: (contentView.frame.height - leftHeight)/2, width: leftWidth, height: leftHeight)
           let labelWidth = leftWidth * 0.8
           leftTextLabel.frame = CGRect(x: 0, y: 0, width: labelWidth, height: contentView.frame.height)
           leftTextLabel.center = CGPoint(x: leftView.bounds.midX, y: leftView.bounds.midY)
           
           // Position the right view
           let rightWidth = contentView.frame.height * 0.95
           let rightHeight = contentView.frame.height * 0.95
           rightView.frame = CGRect(x: contentView.frame.width - rightWidth, y: (contentView.frame.height - rightHeight)/2, width: rightWidth, height: rightHeight)
           let label1Width = rightWidth * 0.4
           let label2Width = rightWidth * 0.4
        // Position the right view
                
        // Position the right text label 1
               rightTextLabel1.frame = CGRect(x: 0, y: 0, width: label1Width, height: contentView.frame.height)
               rightTextLabel1.center = CGPoint(x: rightView.bounds.midX - label2Width/2, y: rightView.bounds.midY)
               rightTextLabel1.textColor = UIColor.black // Set text color to black
               
               // Position the right text label 2
               rightTextLabel2.frame = CGRect(x: label1Width, y: 0, width: label2Width, height: contentView.frame.height)
               rightTextLabel2.center = CGPoint(x: rightView.bounds.midX + label1Width/2, y: rightView.bounds.midY)
               rightTextLabel2.textColor = UIColor.white // Set text color to white
            }
}

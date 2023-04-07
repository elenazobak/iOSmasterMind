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
    let rightTextLabel = UILabel()
    
    // The shadow for the cell
    let shadowView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        // Set up the left view
        leftView.backgroundColor = UIColor(red: 0.85, green: 0.93, blue: 0.99, alpha: 1.0)
        leftView.layer.cornerRadius = 10
        contentView.addSubview(leftView)
        
        // Set up the right view
        rightView.backgroundColor = UIColor(red: 0.67, green: 0.82, blue: 0.94, alpha: 1.0)
        rightView.layer.cornerRadius = 10
        contentView.addSubview(rightView)
        
        // Set up the shadow view
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 2
        shadowView.layer.shadowOpacity = 0.2
        //self.addSubview(shadowView)
        
        // Set up the left text label
        leftTextLabel.textColor = UIColor.white
        leftTextLabel.text = "333445"
        leftTextLabel.font = UIFont(name: "Futura-Bold", size: 17)
        leftTextLabel.textAlignment = .center
        leftView.addSubview(leftTextLabel)
        
        // Set up the right text label
                rightTextLabel.textColor = UIColor.white
                rightTextLabel.font = UIFont(name: "Futura-Bold", size: 17)
        rightTextLabel.text = "1,2"
                rightTextLabel.textAlignment = .center
                rightView.addSubview(rightTextLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Position the left view and text label
        let leftWidth = contentView.frame.width - contentView.frame.height - 4
        let leftHeight = contentView.frame.height * 0.9
        leftView.frame = CGRect(x: 0, y: (contentView.frame.height - leftHeight)/2, width: leftWidth, height: leftHeight)
        let labelWidth = leftWidth * 0.8
        leftTextLabel.frame = CGRect(x: 0, y: 0, width: labelWidth, height: contentView.frame.height)
        leftTextLabel.center = CGPoint(x: leftView.bounds.midX, y: leftView.bounds.midY)
        
        // Position the right view
            let rightWidth = contentView.frame.height * 0.9
            let rightHeight = contentView.frame.height * 0.9
            rightView.frame = CGRect(x: contentView.frame.width - rightWidth, y: (contentView.frame.height - rightHeight)/2, width: rightWidth, height: rightHeight)
            rightTextLabel.sizeToFit()
            rightTextLabel.center = CGPoint(x: rightView.bounds.midX, y: rightView.bounds.midY)
        
        // Position the shadow view
        shadowView.frame = CGRect(x: 10, y: 6, width: contentView.frame.width - 20, height: contentView.frame.height - 12)
    }
}

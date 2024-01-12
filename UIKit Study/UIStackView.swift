//
//  UIStackView.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/12.
//

import UIKit

class StackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.backgroundColor = .gray
        stackView.axis = .vertical
        stackView.spacing = 0.001
        stackView.distribution = .fill
        stackView.alignment = .fill
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "pet1")
        stackView.addArrangedSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.7)
        ])
        
        let label1 = UILabel(frame: CGRect.zero)
        label1.backgroundColor = .blue
        label1.text = "This is a line of text that may have one line or multiple lines."
        label1.numberOfLines = 0
        stackView.addArrangedSubview(label1)
        
        let label2 = UILabel(frame: CGRect.zero)
        label2.backgroundColor = .cyan
        label2.text = ""
        label2.numberOfLines = 0
        stackView.addArrangedSubview(label2)
    }
}

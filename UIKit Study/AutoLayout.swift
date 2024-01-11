//
//  AutoLayout.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/10.
//

import UIKit

class AutoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView(frame: CGRect(origin: CGPoint(x: 20, y: 50), size: CGSize(width: 360, height: 100)))
        redView.backgroundColor = .red
        view.addSubview(redView)

        let blueView = UIView()
        blueView.backgroundColor = .blue

        // Set blueView as a subview of redView
        redView.addSubview(blueView)
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // 1. NSLayoutAnchor
        // Create top, leading, trailing, and bottom constraints with 10pt padding
        blueView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 10).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
        blueView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -10).isActive = true
        blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
        
        // Set the aspect ratio of BlueView to 1:2
        //myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 2.0).isActive = true
        
        // 2. NSLayoutConstraint
//        let leading = NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: redView, attribute: .leading, multiplier: 1.0, constant: 20)
//        let top = NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: redView, attribute: .top, multiplier: 1.0, constant: 20)
//        let trailing = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: redView, attribute: .trailing, multiplier: 1.0, constant: -20)
//        let bottom = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: redView, attribute: .bottom, multiplier: 1.0, constant: -20)
//        redView.addConstraints([leading, top, trailing, bottom])
//        let height = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
//        blueView.addConstraint(height)
        
        // 3. Visual Format Language
//        let views = ["blueView" : blueView]
//        let formatString1 = "V:|-30-[blueView]-30-|"
//        let formatString2 = "H:|-30-[blueView]-30-|"
//         
//        let constraint1 = NSLayoutConstraint.constraints(withVisualFormat: formatString1, options: .alignAllTop, metrics: nil, views: views)
//        let constraint2 = NSLayoutConstraint.constraints(withVisualFormat: formatString2, options: .alignAllTop, metrics: nil, views: views)
//         
//        NSLayoutConstraint.activate(constraint1)
//        NSLayoutConstraint.activate(constraint2)
    }
    
    @IBAction func showXib() {
        let xibVC = XibViewController(nibName: "XibViewController", bundle: nil)
        self.present(xibVC, animated: true, completion: nil)
    }
}

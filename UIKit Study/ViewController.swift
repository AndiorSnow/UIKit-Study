//
//  ViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        // The starting point of UI code, view loading completed but not yet displayed
        // Here, you can do some initialization work, such as adding and removing views, modifying constraints, and loading data
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("\(type(of: self)): \(#function)")
        
        // UIViewController has a view as the background
        //self.view
        // Modify background color
        //self.view.backgroundColor = UIColor.red
        
        // UIView
        // The first construction method
        let view1 = UIView()
        view1.backgroundColor = UIColor.red
        // Set the position and width/height of this view in the parent view
        view1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        // center
        //view1.center = CGPoint(x: 100, y: 100)
        // Add view1 to the view as a subview
        self.view.addSubview(view1)
        
        // The second construction method
        let view2 = UIView(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
        view2.backgroundColor = UIColor.blue
        self.view.addSubview(view2)
        
        // A parent view can contain multiple child views
        print(self.view.subviews.count)
        // Put view1 on the top layer
        self.view.bringSubviewToFront(view1)
        // Put view1 at the bottom level
        self.view.sendSubviewToBack(view1)
        // Swap two views
        self.view.exchangeSubview(at: 0, withSubviewAt: 1)
        // Place view2 at a certain index position
        self.view.insertSubview(view2, at: 1)
        // Place view2 on top of view1
        self.view.insertSubview(view2, aboveSubview: view1)
        // Place view2 under view1
        self.view.insertSubview(view2, belowSubview: view1)
        
        
        // UILabel，subclass of UIView
        let label = UILabel(frame: CGRect(x: 100, y: 250, width: 200, height: 100))
        label.backgroundColor = UIColor.gray
        self.view.addSubview(label)
        
        /*
         // Label used to display text
         label.text = "Text tags, multi line display, with many, many, many, many and many text"
         // Multi line display
         label.numberOfLines = 3
         // font
         //label.font = UIFont(name: "ee", size: <#T##CGFloat#>)
         label.font = UIFont.systemFont(ofSize: 20)
         // bold 1
         label.font = UIFont.boldSystemFont(ofSize: 20)
         // bold 2
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         // center
         label.textAlignment = .center
         // shadow
         label.shadowColor = UIColor.gray
         label.shadowOffset = CGSize(width: 2, height: 2)
         */
        // Rich text
        //label.attributedText
        let str = NSMutableAttributedString(string: "Text tags, multi line display, with many, many, many, many and many text")
        // Dynamically adding attributes
        str.addAttribute(.font, value: UIFont.systemFont(ofSize: 10), range: NSRange(location: 3, length: 3))
        str.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 3, length: 3))
        str.addAttribute(.backgroundColor, value: UIColor.blue, range: NSRange(location: 3, length: 3))
        str.addAttribute(.underlineColor, value: UIColor.yellow, range: NSRange(location: 0, length: 3))
        str.addAttribute(.underlineStyle, value: 1, range: NSRange(location: 0, length: 3))
        //str.addAttributes([], range: <#T##NSRange#>)
        label.attributedText = str
        // Un-dynamically adding attributes
        //label.attributedText = NSAttributedString(string: "111111", attributes: [])
        
        
        // UITextField
        let textField = UITextField(frame: CGRect(x: 50, y: 500, width: 300, height: 30))
        //textField.backgroundColor = UIColor.gray
        // border
        textField.borderStyle = .roundedRect
        // placeholder
        textField.placeholder = "Please enter text"
        // textColor
        textField.textColor = UIColor.black
        // alignment
        textField.textAlignment = .center
        //textField.background = UIImage(named: "iOS Swift")
        // clearButto
        textField.clearButtonMode = .always
        // Add custom views on the left or right side
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view3.backgroundColor = UIColor.blue
        textField.leftView = view3
        textField.leftViewMode = .always
        self.view.addSubview(textField)
        // There are many callback methods for textField, which are passed to us through delegate
        // the extension needs to follow the protocol UITextFieldDelegate
        textField.delegate = self
        
        
        // UITextView
        let textView = UITextView(frame: CGRect(x: 20, y: 550, width: 100, height: 100))
        textView.backgroundColor = UIColor.lightGray
        textView.textColor = UIColor.brown
        textView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textView.text = "This is a long, long, long line of text"
        textView.textAlignment = .left
        // set corner
        textView.layer.cornerRadius = 20
        textView.layer.masksToBounds = true
        // isSelectable
        textView.isSelectable = true
        // isEditable
        textView.isEditable = true
        // isScrollEnable
        textView.isScrollEnabled = true
        // keyboardType
        textView.keyboardType = .default
        self.view.addSubview(textView)
        // Rich text
        //textView.attributedText = str
        
        
        // UIImageView
        let imageView = UIImageView(frame: CGRect(x: 50, y: 350, width: 130, height: 130))
        // display image
        imageView.image = UIImage(named: "iOS Swift")
        self.view.addSubview(imageView)
        
        /*
         // Load a set of images and generate an animation
         // UIImage obtains an optional value, which needs to be forcibly unwrapped within the []
         imageView.animationImages = [UIImage(named: "iOS Swift")!, UIImage(named: "iOS Swift")!, UIImage(named: "iOS Swift")!]
         // animationDuration
         imageView.animationDuration = 1
         // animationRepeatCount，keep repeating when = 0
         imageView.animationRepeatCount = 0
         // start
         imageView.startAnimating()
         */
        
        
        // UIButton
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 150, y: 370, width: 100, height: 50)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("Click me", for: .normal)
        btn.setTitle("Clicked!", for: .highlighted)
        btn.setTitle("Cannot click", for: .disabled)
        // isEnabled
        btn.isEnabled = true
        // set image before the text
        //btn.setImage(UIImage(named: "iOS Swift"), for: .normal)
        // set image as background
        btn.setBackgroundImage(UIImage(named: "iOS Swift"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        // add target for event
        // #The selector can only receive methods annotated with @ objc
        // TouchUpInside represents a complete click action that will only be triggered after "up"
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(btn)

    }
    
    // The event of the button, @objc needs to be added before all events
    @objc func buttonClick() {
        print("Be clicked")
    }

    // The view is about to be displayed on the screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#fileID + "/" + #function)
    }

    // About to lay out the layout of sub views
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#fileID + "/" + #function)
    }

    // Complete the layout of sub views
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#fileID + "/" + #function)
    }
    
    // View has displayed on screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#fileID + "/" + #function)
    }

    // Called when the view is about to disappear, be overwritten, or hidden
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#fileID + "/" + #function)
    }

    // Called when the view has already disappeared, been overwritten, or hidden
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#fileID + "/" + #function)
    }

    deinit {
        print(#fileID + "/" + #function)
    }
}

// UITextField extension protocol complys
extension ViewController: UITextFieldDelegate {
    
    // Clicked the Clear button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#fileID + "/" + #function)
        return true
    }
    
    // Clicked the Return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        // lose the focus
        textField.resignFirstResponder()
        return true
    }
    
    // About to enter editing mode
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#fileID + "/" + #function)
        return true
    }
    
    // Entered editing mode
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#fileID + "/" + #function)
    }
    
    // About to exit editing mode
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#fileID + "/" + #function)
        return true
    }
    // Exitted editing mode
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#fileID + "/" + #function)
    }
    // About to exit change content
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#fileID + "/" + #function)
        return true
    }
    // Changed content
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(#fileID + "/" + #function)
    }
}

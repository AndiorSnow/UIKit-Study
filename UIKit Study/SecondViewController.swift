//
//  SecondViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

protocol CustomDelegate: NSObjectProtocol {
    func doCustomDelegate(a: Int)
}

class SecondViewController: UIViewController {

    weak var delegate: CustomDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#fileID + "/" + #function)

        navigationController?.delegate = self

        let leftButton = UIBarButtonItem(title: "Left", style: .done, target: self, action: #selector(pop(_:)))
        let leftImage = UIBarButtonItem(image: UIImage(named: "btn_stop")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)

//        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItems = [leftButton, leftImage]

        let custom = UIButton()
        custom.setTitle("Custom", for: .normal)
        custom.setTitleColor(.red, for: .normal)
        custom.addTarget(self, action: #selector(custom(_:)), for: .touchDown)
        let customBar = UIBarButtonItem(customView: custom)
        let rightBtn = UIBarButtonItem(title: "Right", style: .plain, target: nil, action: nil)
//        navigationItem.rightBarButtonItem = rightBtn
        navigationItem.rightBarButtonItems = [rightBtn, customBar]
        navigationItem.title = "Second"
//        navigationItem.titleView


    }

    @IBAction func pop(_ sender: Any) {
        navigationController?.popViewController(animated: true)
//        navigationController?.popToRootViewController(animated: true)

//        if let rootVC = navigationController?.viewControllers[0] {
//            navigationController?.popToViewController(rootVC, animated: true)
//        }
    }
    
    @objc func custom(_ sender: Any) {
        print("custom")
        delegate?.doCustomDelegate(a: 100)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#fileID + "/" + #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#fileID + "/" + #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#fileID + "/" + #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#fileID + "/" + #function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#fileID + "/" + #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#fileID + "/" + #function)
    }

    deinit {
        print(#fileID + "/" + #function)
    }
}


extension SecondViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print(#fileID + "/" + #function)
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print(#fileID + "/" + #function)
    }
}


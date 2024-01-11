//
//  HomeViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var button: UIButton!
    private var childVC: UIViewController?

    private var isShowError: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID + "/" + #function)


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

// MARK: - Action
extension HomeViewController {
    @IBAction private func showError(_ sender: Any) {

        if isShowError {
            hiddenError()
        } else {
            displayError()
        }

        print(#fileID + "/" + #function)
    }

    private func displayError() {

        if childVC == nil {
            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
            childVC = storyboard.instantiateViewController(identifier: "ChildViewController")
        }

        guard let childVC = self.childVC else {
            return
        }

        childVC.view.frame = errorView.bounds
        addChild(childVC)
        errorView.addSubview(childVC.view)
        childVC.didMove(toParent: self)

        isShowError = true
        button.setTitle("Hidden Error", for: .normal)
        
        print(#fileID + "/" + #function)
    }

    private func hiddenError() {
        guard let childVC = self.childVC else {
            return
        }
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
        isShowError = false
        button.setTitle("Show Error", for: .normal)
        self.childVC = nil
        
        print(#fileID + "/" + #function)
    }
}


//
//  RootViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#fileID + "/" + #function)

        navigationItem.title = "ABCD"

        let item1 = UIBarButtonItem(title: "Button1", style: .plain, target: nil, action: nil)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let item2 = UIBarButtonItem(title: "Button2", style: .plain, target: nil, action: nil)

        setToolbarItems([item1, space, item2], animated: true)
        
    }

    @IBAction func click(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }

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

extension RootViewController: CustomDelegate {
    func doCustomDelegate(a: Int) {
        print("Second delegate", a)
    }
}

extension RootViewController: UITableViewDataSource {
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    // UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell? = tableView.dequeueReusableCell(withIdentifier: "tableCell_id") as? SearchCell

        return cell!
    }
}

extension RootViewController: UITableViewDelegate {
    
}

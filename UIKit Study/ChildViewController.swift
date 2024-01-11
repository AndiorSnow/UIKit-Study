//
//  ChildViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/10.
//

import UIKit
import WebKit

class ChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID + "/" + #function)
        
        // WKWebView
        // Load Page
        let webConfiguration = WKWebViewConfiguration()
        let myURL = URL(string: "https://cn.bing.com")
        let webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        // Dynamically load and run JS code
//        // JS code fragment
//        let jsStr = "var checkBtn = document.getElementsByClassName('check_box');for(var j = 0;j < checkBtn.length; j++){checkBtn[j].onclick = function(){this.removeAttribute('checked');}}"
//
//        // Initialize WKUserScript object based on JS string
//        let userScript = WKUserScript(source: jsStr, injectionTime:.atDocumentEnd, forMainFrameOnly: true)
//        let userContentController = WKUserContentController()
//        userContentController.addUserScript(userScript)
//
//        // Initialize WKWebViewConfiguration based on the generated WKUserScript object
//        webConfiguration.userContentController = userContentController
//        let userWebview = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
//        view.addSubview(userWebview)
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

// Provides a delegate method that can be used to track the loading process
extension ChildViewController: WKNavigationDelegate {
    
    // Called when the page starts loading
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#fileID + "/" + #function)
    }
    
    // Called when the content begins to return
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print(#fileID + "/" + #function)
    }
    
    // Called after the page is loaded
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#fileID + "/" + #function)
    }
    
    // Called when page loading fails
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(#fileID + "/" + #function)
    }
    
    // Called after receiving the server jump request
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(#fileID + "/" + #function)
    }
    
    // Decide whether to jump after receiving the response
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
        print(#fileID + "/" + #function)
    }
    
    // Decide whether to redirect before sending the request
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(WKNavigationActionPolicy.allow)
        print(#fileID + "/" + #function)
    }
}

// Create some configurations for initialization loading
extension ChildViewController: WKUIDelegate {
    // Called when calling the alert function (processing prompt boxes in webpages) on the JS side.
    // The data passed by the JS side can be obtained through the message.
    // The JS side can be called back through the complexHandler
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alertView = UIAlertController.init(title: "prompt", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction.init(title: "confirm", style: UIAlertAction.Style.destructive) {
            (action:UIAlertAction) in completionHandler()
        }
        alertView.addAction(okAction)
        print(#fileID + "/" + #function)
    }
    
    // Calling the confirm function on the JS side (handling confirmation boxes in webpages)
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alertView = UIAlertController.init(title: "prompt", message:message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction.init(title: "cancel", style: UIAlertAction.Style.cancel) { (action:UIAlertAction) in
            completionHandler(false)
        }
        alertView.addAction(cancelAction)
        let okAction = UIAlertAction.init(title: "confirm", style: UIAlertAction.Style.default) { (action:UIAlertAction) in
            completionHandler(true)
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
        print(#fileID + "/" + #function)
    }
    
    // Call the prompt function on the JS side (to handle text input in webpage), requiring input of a segment of text
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alertTextField = UIAlertController.init(title: "Please enter", message: "JS call input box",
                                                    preferredStyle: UIAlertController.Style.alert)
        alertTextField.addTextField { (textField:UITextField) in
            textField.textColor = UIColor.red
        }
        let okAction = UIAlertAction.init(title: "confirm", style: UIAlertAction.Style.destructive) { (action:UIAlertAction) in
            completionHandler(alertTextField.textFields?.last?.text)
        }
        alertTextField.addAction(okAction)
        self.present(alertTextField, animated: true, completion: nil)
        print(#fileID + "/" + #function)
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        // Process WKWebView shutdown time
        print(#fileID + "/" + #function)
    }
    
}

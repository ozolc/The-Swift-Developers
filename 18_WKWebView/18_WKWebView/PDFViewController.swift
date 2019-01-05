//
//  PDFViewController.swift
//  18_WKWebView
//
//  Created by Maksim Nosov on 14/08/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController {
    
    var webWiew = WKWebView()
    let application = UIApplication.shared
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PDF Viewer"
        setupUI()
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        let pdf = ["sample.pdf"]
        let activityController = UIActivityViewController(activityItems: pdf, applicationActivities: nil)
        DispatchQueue.main.async {
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
    func setupUI() {
        webWiew = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        if let myURL = Bundle.main.url(forResource: "sample", withExtension: "pdf") {
            let myRequest = URLRequest(url: myURL)
            webWiew.load(myRequest)
        }
        webWiew.navigationDelegate = self
        
        view.addSubview(webWiew)
        view.addSubview(myToolbar)
        view.addSubview(activityIndicator)
        webWiew.uiDelegate = self
    }
    
    func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        application.isNetworkActivityIndicatorVisible = isAnimated
        if isAnimated {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
}

extension PDFViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        isWorkIndicator(isAnimated: true, indicator: activityIndicator)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isWorkIndicator(isAnimated: false, indicator: activityIndicator)
    }
}

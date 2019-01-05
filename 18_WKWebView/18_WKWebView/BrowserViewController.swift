//
//  BrowserViewController.swift
//  18_WKWebView
//
//  Created by Maksim Nosov on 14/08/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {
    
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    @IBOutlet weak var reloadItem: UIBarButtonItem!
    
    @IBOutlet weak var myToolbar: UIToolbar!
    
    var webWiew = WKWebView()
    var progBar = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
        if self.webWiew.canGoBack {
            self.webWiew.stopLoading()
            self.webWiew.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: UIBarButtonItem) {
        if self.webWiew.canGoForward {
            self.webWiew.stopLoading()
            self.webWiew.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        self.webWiew.stopLoading()
        webWiew.reload()
    }
    
    func setupUI() {
        webWiew = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        if let myUrl = URL(string: "https://www.yandex.ru") {
            let request = URLRequest(url: myUrl)
            webWiew.load(request)
        }
        
        webWiew.uiDelegate = self
        webWiew.navigationDelegate = self
        
        self.progBar = UIProgressView(frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: 50))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.red
        webWiew.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: NSKeyValueObservingOptions.new, context: nil)
        webWiew.addSubview(progBar)
        
        view.addSubview(webWiew)
        view.addSubview(myToolbar)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webWiew.estimatedProgress), animated: true)
            
            if (self.webWiew.estimatedProgress >= 1.0) {
                UIView.animate(withDuration: 1.0, delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                    self.progBar.alpha = 0.0
                }, completion: { (finished: Bool) -> Void in
                    self.progBar.progress = 0
                })
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webWiew.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension BrowserViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
        
        if webView.canGoBack {
            goBackItem.isEnabled = true
        } else if webView.canGoForward {
            goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if ((navigationAction.targetFrame?.isMainFrame)!) {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        goBackItem.isEnabled = false
        goForwardItem.isEnabled = false
    }
}

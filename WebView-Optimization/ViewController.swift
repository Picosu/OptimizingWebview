//
//  ViewController.swift
//  WebView-Optimization
//
//  Created by Kent Winder on 06/01/2018.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var webView: WKWebView!
    var popupWebView: WKWebView?
    var urlPath: String = "https://s167-fr.ogame.gameforge.com/game/index.php?page=messages&cp=34077903"
    
    var loginButtonName = "Volans – Joueurs en ligne: 241"
    
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var customV2: UIButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadWebView()
    }
    
    func setupWebView() {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        self.view.bringSubviewToFront(customButton)
        self.view.bringSubviewToFront(customV2)
    }
    
    func loadWebView() {
        if let url = URL(string: urlPath) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    @IBAction func customButton(_ sender: Any) {
        login()
    }
    
    @IBAction func customV2(_ sender: Any) {
        getLoginButtonName()
    }
    
    func getLoginButtonName() {
        var joinGame = ""
        self.webView.evaluateJavaScript("document.getElementById(\"joinGame\").innerHTML") {(response, error) in
            // Should be an array
            if let button = response as? [String] {
                print(button)
            }
            if (response != nil) {
                joinGame = "\(response!)"
                var result = joinGame.components(separatedBy: ">")
                var buttonLogin = result[result.capacity-4]
                
                result = buttonLogin.components(separatedBy: "<")
                buttonLogin = result.first!
                self.loginButtonName = buttonLogin.replacingOccurrences(of: "&nbsp;", with: "")
                TestingManager(string: self.loginButtonName)
            } else {
                print("\(error)")
            }
        }
       
        
        /// Fonctionne si déblocage Webview
//        self.webView.evaluateJavaScript("document.getElementById(\"joinGame\").getElementsByClassName(\"button\")[1].click()")
    }
    
    func login() {
        print("\(webView.url)")
        self.webView.evaluateJavaScript("document.getElementById(\"joinGame\").getElementsByClassName(\"button\")[1].click()") {(response, error) in
            // Should be an array
            if let button = response as? [String] {
            }
        }
    }
}

extension ViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
        popupWebView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView!.navigationDelegate = self
        popupWebView!.uiDelegate = self
        view.addSubview(popupWebView!)
        return popupWebView!
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        webView.removeFromSuperview()
        popupWebView = nil
    }
}

extension ViewController: WKNavigationDelegate {
    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("\(webView.debugDescription) \nis loaded")
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

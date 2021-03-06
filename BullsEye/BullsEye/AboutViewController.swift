//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Bobby McBride on 10/22/18.
//  Copyright © 2018 Bobby McBride. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close(){
        mediumButton()
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        mediumButton()
    }
    
    func mediumButton() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }

}

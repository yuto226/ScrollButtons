//
//  ViewController.swift
//  ScrollButtontsDemo
//
//  Created by suzuki-yuto on 2022/01/04.
//

import UIKit
import ScrollButtons

class ViewController: UIViewController {
    @IBOutlet private weak var scrollButtonsDemoArea1: UIView!
    @IBOutlet private weak var buttonTapResultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIButton()
        button1.setTitle("Example Button1", for: .normal)
        button1.setTitleColor(UIColor.blue, for: .normal)
        button1.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.blue.cgColor
        button1.addTarget(self, action: #selector(button1OnTap(sender:)), for: .touchUpInside)
        
        let button2 = UIButton()
        button2.setTitle("Example Long Long Button2", for: .normal)
        button2.setTitleColor(UIColor.red, for: .normal)
        button2.layer.borderWidth = 0.5
        button2.layer.borderColor = UIColor.red.cgColor
        button2.addTarget(self, action: #selector(button2OnTap(sender:)), for: .touchUpInside)
        
        let button3 = UIButton()
        button3.setTitle("Ex Short Btn3", for: .normal)
        button3.setTitleColor(UIColor.green, for: .normal)
        button3.layer.borderWidth = 0.5
        button3.layer.borderColor = UIColor.green.cgColor
        button3.addTarget(self, action: #selector(button3OnTap(sender:)), for: .touchUpInside)
        
        
        let scrollButtonsVC = ScrollButtonsViewController.instantiate(buttons: [button1, button2, button3])
        scrollButtonsDemoArea1.addSubview(scrollButtonsVC.view)
        scrollButtonsVC.view.frame = scrollButtonsDemoArea1.bounds
        
    }
    
    // button on tap
    @objc func button1OnTap(sender: UIButton) {
        buttonTapResultLabel.text = "Button1 Tapped"
        buttonTapResultLabel.textColor = UIColor.blue
    }
    
    // button on tap
    @objc func button2OnTap(sender: UIButton) {
        buttonTapResultLabel.text = "Button2 Tapped"
        buttonTapResultLabel.textColor = UIColor.red
    }
    
    // button on tap
    @objc func button3OnTap(sender: UIButton) {
        buttonTapResultLabel.text = "Button3 Tapped"
        buttonTapResultLabel.textColor = UIColor.green
    }


}


//
//  scrollButtonsViewController.swift
//  scrollButtons
//
//  Created by suzuki-yuto on 2022/01/04.
//

import Foundation
import UIKit

public class ScrollButtonsViewController: UIViewController {
    @IBOutlet private weak var horiziontalScrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var contentViewWidthConstraint: NSLayoutConstraint!
    
    public var buttonMargin: CGFloat!
    public var buttons: [UIButton]!
    
    private let DEFAULT_MARGIN = 32.0
    
    public static func instantiate(buttons: [UIButton], buttonMargin: CGFloat? = nil) -> ScrollButtonsViewController {
        let storyboard = UIStoryboard(name: "ScrollButtonsViewController", bundle: Bundle(for: ScrollButtonsViewController.self))
        let viewController = storyboard.instantiateInitialViewController() as! ScrollButtonsViewController
        
        viewController.buttons = buttons
        viewController.buttonMargin = buttonMargin ?? viewController.DEFAULT_MARGIN
        return viewController
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        for btn in buttons {
            // constraint of layout
            btn.translatesAutoresizingMaskIntoConstraints = false
            switch contentView.subviews.count {
            case 0:
                // first button
                self.contentView.addSubview(btn)
                btn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: buttonMargin).isActive = true
                btn.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                btn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            case buttons.count:
                // last button
                guard let lastBtn = contentView.subviews.last else { continue }
                self.contentView.addSubview(btn)
                btn.leftAnchor.constraint(equalTo: lastBtn.rightAnchor, constant: buttonMargin).isActive = true
                btn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: buttonMargin).isActive = true
                btn.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                btn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            default:
                // between button
                guard let lastBtn = contentView.subviews.last else { continue }
                self.contentView.addSubview(btn)
                btn.leftAnchor.constraint(equalTo: lastBtn.rightAnchor, constant: buttonMargin).isActive = true
                btn.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                btn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            }
        }
        contentViewWidthConstraint.constant = calcButtonsWidth()
        contentView.setNeedsUpdateConstraints()
        contentView.updateConstraintsIfNeeded()
    }
    
    private func calcButtonsWidth() -> CGFloat {
        var buttonsWidth = buttons.map{ $0.sizeThatFits(CGSize(width: 0.0, height: 0.0)).width as CGFloat }.reduce(0.0, { $0 + $1 })
        buttonsWidth += (buttonMargin * CGFloat(buttons.count + 1))
        
        return buttonsWidth
    }
    
    
}

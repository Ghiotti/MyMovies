//
//  MainTextField.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class MainTextField: UITextField {

    var leftPadding: CGFloat = 8
    private var isToogleButtonEnable = false
    var toogleButtonAction: (() -> Void)?

    // MARK: Publics Methods

    func setUpToggleButton(imageButton: UIImage?, toogleAction: @escaping () -> Void) {
        toogleButtonAction = toogleAction
        let button = UIButton(type: .custom)
        button.setImage(imageButton, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.perfomToogleButtonAction), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        isToogleButtonEnable = true
        self.reloadInputViews()
        isToogleButtonEnable = true
    }

    @objc private func perfomToogleButtonAction() {
        toogleButtonAction?()
    }

    // MARK: Private Methods

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // Placeholder padding for Custom Textfield
        if isToogleButtonEnable {
            return CGRect(x: bounds.origin.x + leftPadding, y: bounds.origin.y, width: bounds.size.width - leftPadding*2 - 40, height: bounds.size.height)
        }
        return CGRect(x: bounds.origin.x + leftPadding, y: bounds.origin.y, width: bounds.size.width - leftPadding*2, height: bounds.size.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // Text padding for Custom Textfield
        if isToogleButtonEnable {
            return CGRect(x: bounds.origin.x + leftPadding, y: bounds.origin.y, width: bounds.size.width - leftPadding*2 - 40, height: bounds.size.height)
        }

        return CGRect(x: bounds.origin.x + leftPadding, y: bounds.origin.y, width: bounds.size.width - leftPadding*2, height: bounds.size.height)
    }
}

//
//  MainViewController.swift
//  BalkaniaiPad
//
//  Created by Alex Golub on 9/6/17.
//  Copyright © 2017 Alex Golub. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var rsContainerView: UIView!
    @IBOutlet weak var srContainerView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    fileprivate var selectedPlist: String!
    fileprivate var savedSelectedPlist = "savedSelectedPlist"
    fileprivate let russianSerbianPlist = "DICT_R-S"
    fileprivate let serbianRussianPlist = "DICT_S-R"
    fileprivate let rsSegueIdentifier = "rsSegue"
    fileprivate let srSegueIdentifier = "srSegue"
    fileprivate let animationDuration: TimeInterval = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillHide(notification:)),
                                       name:NSNotification.Name.UIKeyboardWillHide,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillShow(notification:)),
                                       name:NSNotification.Name.UIKeyboardWillShow,
                                       object: nil)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == rsSegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryName = russianSerbianPlist
        } else if segue.identifier == srSegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryName = serbianRussianPlist
        }
    }
}

extension MainViewController {
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: animationDuration) {
            self.bottomConstraint.constant = 0
        }
    }

    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        UIView.animate(withDuration: animationDuration) {
            self.bottomConstraint.constant = keyboardSize.height
        }
    }
}

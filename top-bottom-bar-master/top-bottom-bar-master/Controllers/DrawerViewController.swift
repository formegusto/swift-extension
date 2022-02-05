//
//  DrawerViewController.swift
//  top-bottom-bar-master
//
//  Created by formegusto on 2022/02/05.
//

import UIKit

class DrawerViewController: UIViewController {

    @IBOutlet weak var drawerInactive: NSLayoutConstraint!
    @IBOutlet weak var drawerActive: NSLayoutConstraint!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var drawerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        bgView.isUserInteractionEnabled = true
        let bgTab = UITapGestureRecognizer(target: self, action: #selector(dismissDrawer))
        bgView.addGestureRecognizer(bgTab)
        
        self.bgView.alpha = 0
    }
    
    @objc func dismissDrawer() {
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.bgView.alpha = 0
            self.drawerInactive.isActive = true
            self.drawerActive.isActive = false
            
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.bgView.alpha = 0.5
            self.drawerInactive.isActive = false
            self.drawerActive.isActive = true
            
            self.view.layoutIfNeeded()
        }
    }

}

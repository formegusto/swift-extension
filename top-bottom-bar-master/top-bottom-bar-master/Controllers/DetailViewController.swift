//
//  DetailViewController.swift
//  top-bottom-bar-master
//
//  Created by formegusto on 2022/02/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstBgView: UIView!
    @IBOutlet weak var firstBgViewLeading: NSLayoutConstraint!
    @IBOutlet weak var firstBgViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var secondBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRightTitle()
        setBackBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setFirstBgView()
        setSecondBgView()
    }
    
    func setSecondBgView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.secondBgView.bounds
        
        let viewWidth = self.view.frame.width - 120
        
        let color1: CGColor = UIColor(displayP3Red: 79/255, green: 228/255, blue: 211/255, alpha: 1).cgColor
        let color2: CGColor = UIColor(displayP3Red: 23/255, green: 115/255, blue: 201/255, alpha: 1).cgColor
        gradient.colors = [color1, color2]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.secondBgView.roundCorners(corners: [.topRight, .bottomLeft], radius: viewWidth / 4)
        
        self.secondBgView.layer.shadowOpacity = 0.7
        self.secondBgView.layer.shadowOffset = CGSize(width: 20, height: 0)
        self.secondBgView.layer.shadowRadius = 10
        self.secondBgView.layer.masksToBounds = false
        
        self.secondBgView.layer.addSublayer(gradient)
    }
    
    func setFirstBgView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let viewWidth = self.view.frame.width
        let viewHeight = self.firstBgView.frame.height
//        self.firstBgViewLeading.constant = (viewWidth * 0.5) * -1
//        self.firstBgViewTop.constant = (viewWidth) * -1
        self.firstBgView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        gradient.frame = self.firstBgView.frame
        
        let color1: CGColor = UIColor(displayP3Red: 20/255, green: 75/255, blue: 125/255, alpha: 1).cgColor
        let color2: CGColor = UIColor(displayP3Red: 144/255, green: 61/255, blue: 194/255, alpha: 1).cgColor
        gradient.colors = [color1, color2]
        gradient.locations = [0.0, 1.0]
        
        
        self.firstBgView.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 48)
        self.firstBgView.layer.addSublayer(gradient)
    }
    
    func setBackBtn() {
        let backImage = UIImage(systemName: "arrow.left")

        if let hasImage = backImage {
            self.navigationController?.navigationBar.backIndicatorImage = hasImage
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = hasImage
            self.navigationController?.navigationBar.tintColor = UIColor(red: 33, green: 33, blue: 33, alpha: 1)
        }
    }
    
    func setRightTitle() {
        let burger = UIImage(named: "burger")
        let burgerView = UIImageView.init(image: burger)
        
        burgerView.contentMode = .scaleAspectFit
        burgerView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        burgerView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let imageItem = UIBarButtonItem.init(customView: burgerView)
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpacer.width = 16
        
        self.navigationItem.rightBarButtonItems = [rightSpacer,imageItem]
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat){
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
    }
}

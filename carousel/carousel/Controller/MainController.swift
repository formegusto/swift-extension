//
//  ViewController.swift
//  carousel
//
//  Created by formegusto on 2022/02/08.
//

import UIKit

class MainController: UIViewController {
    
    var naviInsets:UIEdgeInsets?
    @IBOutlet weak var noticeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviInsets = self.navigationController?.navigationBar.layoutMargins
        
        makeLeftItem()
        makeRightItem()
        setLineHeight()
        
    }
    
    @IBAction func goCollection(_ sender: Any) {
        let CollectionVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
//        self.navigationController?.present(CollectionVC, animated: true, completion: nil)
        self.present(CollectionVC, animated: true, completion: nil)
    }
    
    func setLineHeight() {
        let style = NSMutableParagraphStyle()
        let fontSize: CGFloat = 28
        let lineHeight: CGFloat = fontSize * 1.6
        
        style.minimumLineHeight = lineHeight
        style.maximumLineHeight = lineHeight
        
        noticeText.attributedText  = NSAttributedString(
            string: "김크림님,\n설계사 자격증 시험까지\n6일 남았어요!", attributes: [.paragraphStyle: style]
        )
        noticeText.font = UIFont(name: "Helvetica Bold", size: fontSize)
        noticeText.textColor = .white
    }
    
    func makeLeftItem() {
        self.navigationItem.backButtonTitle = ""
        guard let img: UIImage = UIImage(named: "let_logo_white") else {
            return
        }
        let imgView: UIImageView = UIImageView(image:img)
        let logoBtn: UIBarButtonItem = UIBarButtonItem(customView: imgView)
        logoBtn.customView?.widthAnchor.constraint(equalToConstant: 38.06).isActive = true
        logoBtn.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let leftSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftSpacer.width = 32 - (naviInsets != nil ? naviInsets!.left : 0)
        
        self.navigationItem.leftBarButtonItems = [leftSpacer,logoBtn]
    }
    
    func makeRightItem() {
        guard let img: UIImage = UIImage(named: "burger") else {
            return
        }
        
        let imgView: UIImageView = UIImageView(image:img)
        let burger: UIBarButtonItem = UIBarButtonItem(customView: imgView)
        
        burger.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        burger.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpacer.width = 32 - (naviInsets != nil ? naviInsets!.right : 0)
        
        self.navigationItem.rightBarButtonItems = [rightSpacer,burger]
        
    }


}


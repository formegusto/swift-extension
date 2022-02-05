import UIKit

class MainController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var customBtn: UIButton!
    @IBOutlet weak var customBtnLeading: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewUI()
        
        setLeftTitle()
        setRightTitle()
//
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//
//        // window 인거 찾아서 가지고 온다.
//        let window = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first
//        if let hasStatusBar = sceneDelegate?.statusBarView {
//            window?.addSubview(hasStatusBar)
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showCustomBtn()
    }
    
    func setRightTitle() {
        let burger = UIImage(named: "burger")
        let burgerView = UIImageView.init(image: burger)
        
        burgerView.contentMode = .scaleAspectFit
        burgerView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        burgerView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        burgerView.isUserInteractionEnabled = true
        let clickEvent = UITapGestureRecognizer(target: self, action: #selector(showDrawer))
        burgerView.addGestureRecognizer(clickEvent)
        
        let imageItem = UIBarButtonItem(customView: burgerView)
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpacer.width = 16
        
        
        self.navigationItem.rightBarButtonItems = [rightSpacer,imageItem]
        
    }
    
    func setLeftTitle() {
        
        self.navigationItem.backButtonTitle = ""
        let logoImage = UIImage(named: "let_icon_transparent")
        let logoImageView = UIImageView.init(image: logoImage)
        
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
            
        imageItem.customView?.widthAnchor.constraint(equalToConstant: 38.06).isActive = true
        imageItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let leftSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)

        // 기본적으로 navibar는 8pt 깔려있음
        leftSpacer.width = 24
        
        navigationItem.leftBarButtonItems = [leftSpacer, imageItem]
    }
    
    @objc func showDrawer() {
        let drawerVC = DrawerViewController(nibName: "DrawerViewController", bundle: nil)
        drawerVC.modalPresentationStyle = .overFullScreen
        self.present(drawerVC, animated: false, completion: nil)
    }
    
    func setViewUI() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        
        let color1: CGColor = UIColor(displayP3Red: 20/255, green: 75/255, blue: 125/255, alpha: 1).cgColor
        let color2: CGColor = UIColor(displayP3Red: 144/255, green: 61/255, blue: 194/255, alpha: 1).cgColor
        gradient.colors = [color1, color2]
        
        
        view.layer.addSublayer(gradient)
        view.addSubview(buttonView)
        customBtn.layer.cornerRadius = 30
        customBtn.contentHorizontalAlignment = .right
    }
    
    func showCustomBtn(){
        customBtnLeading.constant = -60
        
        UIView.animate(withDuration: 0.75) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func customBtnClick(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        print(self.view.frame)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension UINavigationController {

    public func pushViewController(_ viewController: UIViewController, animated: Bool,completion: (() -> Void)?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }

}


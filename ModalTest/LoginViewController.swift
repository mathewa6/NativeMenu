//Because we want some custom behaviour like the keyboard and login actions, we subclass UIViewController again for each menu item.

import UIKit

class LoginViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = "Login"
    }
    
    @IBAction func startLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showMenu(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MenuNavigation")
        controller?.modalPresentationStyle = .FullScreen
        controller?.modalTransitionStyle = .CoverVertical
        self.navigationController?.presentViewController(controller!, animated: true, completion: nil)
    }
    //http://www.ioscreator.com/tutorials/move-view-behind-keyboard-ios8-swift
    
    override func viewDidLoad() {
        let menuButton = UIBarButtonItem(title: "Menu",
                                         style: .Plain,
                                         target: self,
                                         action: #selector(showMenu(_:)))
        self.navigationItem.rightBarButtonItem = menuButton
    }
    

}

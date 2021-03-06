//This is the main ViewController. Notice how all ViewControllers(VC) are subclasses of UIViewController.

import UIKit

class ViewController: UIViewController {

    let model = DataModel()
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        print("EXIT : \(segue.sourceViewController.description)")
    }
    
    func menuDismiss(notification: NSNotification) {
        print("Received")
        if let info = notification.userInfo {
            let s = info["vc"]  as! UIViewController
            self.navigationController?.pushViewController(s, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(menuDismiss(_:)),
                                                         name: model.menuDismissedNotification,
                                                         object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


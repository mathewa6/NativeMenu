//This is the main ViewController. Notice how all ViewControllers(VC) are subclasses of UIViewController.

import UIKit

class ViewController: UIViewController {

    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        print("EXIT : \(segue.sourceViewController.description)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


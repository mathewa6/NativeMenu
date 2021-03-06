
import UIKit

class MenuViewController: UITableViewController {
    let model = DataModel()

    override func viewDidLoad() {
        self.title = "Menu"
    }
    
    @IBAction func dismissMenu(sender: UIBarButtonItem) {
        self.prepareForDismiss(nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.menuList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "MenuCellIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        cell.textLabel?.text = model.menuList[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var controllerToPush: UIViewController?
        
        if indexPath.row == 0 {
            controllerToPush = self.storyboard?.instantiateViewControllerWithIdentifier("Login")
        } else {
            controllerToPush = self.storyboard?.instantiateViewControllerWithIdentifier("Other")
            controllerToPush?.title = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        }
        
        self.prepareForDismiss(["vc" : controllerToPush!])
        
//        self.navigationController?.pushViewController(controllerToPush!, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func prepareForDismiss(dict: [String : UIViewController]?) {
        self.dismissViewControllerAnimated(true) {
            NSNotificationCenter.defaultCenter().postNotificationName(self.model.menuDismissedNotification, object: nil, userInfo: dict)
            print("Posted")
        }
    }
}

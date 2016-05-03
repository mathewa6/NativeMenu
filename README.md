NativeMenu
===

In trying to help a friend create a Menu structure using only Native iOS View Controllers, I tried to recreate the behaviour
of the WishList in the iOS App Store app.

## Setup ##

From Storyboards, it's simple. Simply insert a VC, set it's class to MenuViewController. Embed it in a UINavigationController and then,
set a segue from your VC to the UINavigationController.

Programmatically, you can do the same. I've just set the Storyboard Identifier for the segue to the UINavigationController and then
dropped this in.

```obj-c
    func showMenu(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MenuNavigation")
        controller?.modalPresentationStyle = .FullScreen
        controller?.modalTransitionStyle = .CoverVertical
        self.navigationController?.presentViewController(controller!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let menuButton = UIBarButtonItem(title: "Menu",
                                         style: .Plain,
                                         target: self,
                                         action: #selector(showMenu(_:)))
        self.navigationItem.rightBarButtonItem = menuButton
    }
```

## Note ##
The project's name does not match the Repository's because it started out as a ... *ModalTest*.

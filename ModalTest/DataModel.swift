//This is the data of your app. It will keep track of whether the user is logged in, what items to show, etc. Use this class to communicate over the network with your API.

import UIKit

class DataModel: NSObject {
    let menuList = ["Login", "Shop", "Contact Us", "Help"]
    
    override init() {
        print("Data Ready")
    }
}

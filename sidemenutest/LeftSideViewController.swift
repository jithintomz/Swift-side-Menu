import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuItems:[String] = ["Main","About"];
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        self.tableView.backgroundColor = UIColor(red: 110 / 255, green: 113 / 255, blue: 115 / 255, alpha: 1.0)
        self.tableView.separatorStyle = .None
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 161 / 255, green: 164 / 255, blue: 166 / 255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 55 / 255, green: 70 / 255, blue: 77 / 255, alpha: 1.0)]
        
        self.view.backgroundColor = UIColor.clearColor()


        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
        var mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        mycell.selectionStyle = .Blue
        mycell.accessoryType = .Checkmark
        
        mycell.menuItemLabel.text = menuItems[indexPath.row]
        
        return mycell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        switch(indexPath.row)
        {
            
        case 0:
            
            var centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            
            var centerNavController = UINavigationController(rootViewController: centerViewController)
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggleDrawerSide(DrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        case 1:
            
            var aboutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AboutViewController") as! AboutViewController
            
            var aboutNavController = UINavigationController(rootViewController: aboutViewController)
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.centerContainer!.centerViewController = aboutNavController
            appDelegate.centerContainer!.toggleDrawerSide(DrawerSide.Left, animated: true, completion: nil)
            
            break;
            
        default:
            
            println("\(menuItems[indexPath.row]) is selected");
        
        }
        
    }
    
}
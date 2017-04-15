//
//  MainTableViewController.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-13.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import UIKit
import CoreData

extension MainTableViewController: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    }
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "createNote", sender: nil)
    }
    
}


class MainTableViewController: UITableViewController {
    @IBOutlet weak var noteCountFooter: UIBarButtonItem!
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredNotes = [Note]()
    
    var detailViewController: DetailViewController? = nil
    var noteList = [Note]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simple Notes"
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        configureSearchController()
        //database test methods (clear database, then generate notes)
        deleteAllNotes()
        createNotesForTest()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        searchController.isActive = true
        //searchController.searchBar.becomeFirstResponder()
    }
    
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["All", "Text", "Picture", "Video", "Audio"]
        searchController.searchBar.delegate = self
        searchController.searchBar.setValue("+", forKey: "_cancelButtonText")
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func loadNotes() {
       
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            self.noteList = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
             print(noteList)
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
       noteCountFooter.title = "\(noteList.count)"+" Notes"
    }
    

    func createNotesForTest(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var textNote = TextNote(context: context)
        textNote.id = UUID().uuidString
        textNote.title = "Note 1"
        textNote.text = "A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse."
        textNote.date = NSDate()
        textNote.type = "Text"
        textNote.authentication?.addToNote(textNote)
        do {
            //Ask the context object created above to commit unsaved modification of its object to the database
            try context.save()
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
        
        //Reload the staff members associated to the current manager
        self.loadNotes()
        //Refill the table view with data
        self.tableView.reloadData()
        
        textNote = TextNote(context: context)
        textNote.id = UUID().uuidString
        textNote.title = "Note 2"
        textNote.text = "A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse.A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse."
        textNote.date = NSDate()
        textNote.type = "Text"
        textNote.passwordProtected = true
        textNote.authentication?.addToNote(textNote)
        do {
            //Ask the context object created above to commit unsaved modification of its object to the database
            try context.save()
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
        
        //Reload the staff members associated to the current manager
        self.loadNotes()
        //Refill the table view with data
        self.tableView.reloadData()
        
        textNote = TextNote(context: context)
        textNote.id = UUID().uuidString
        textNote.title = "Note 3"
        textNote.text = "A malesuada suspendisse parturient vivamus turpis erat aliquam vestibulum elit integer adipiscing consectetur cras adipiscing a eu fusce aliquam. A a facilisis aptent neque purus massa eget sem ac adipiscing malesuada per lorem sed ullamcorper consectetur ad condimentum. Eget velit lobortis platea per convallis ad nascetur vestibulum parturient a fringilla taciti vitae sit a venenatis habitant vestibulum vestibulum felis. A torquent semper cras vestibulum habitasse mauris ornare id ut massa posuere leo viverra parturient inceptos tristique pretium convallis quis proin suspendisse."
        textNote.date = NSDate()
        textNote.type = "Text"
        textNote.authentication?.addToNote(textNote)
        do {
            //Ask the context object created above to commit unsaved modification of its object to the database
            try context.save()
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
        
        //Reload the staff members associated to the current manager
        self.loadNotes()
        //Refill the table view with data
        self.tableView.reloadData()

    }
    
    func deleteAllNotes() {
      
        //Reload the staff members associated to the current manager
        self.loadNotes()
        //Refill the table view with data
        self.tableView.reloadData()
    
    //If the managerList is not empty
    if noteList.count != 0 {
   
    //Get the persistent container associated with the App (NSPersistentContainer simplifies the creation and management of the Core Data stack)
    //Get the context associated to the container to acces managed objects
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    for obj in noteList {//Take each object in the managerList
    //delete that object from the dabatase
    context.delete(obj)
    }
    do {
    //Ask the context object created above to commit unsaved modification of its object to the database
    try context.save()
    } catch {
    print(String(format: "Error %@: %d",#file, #line))
    }
    //Assign an empty manager array to the managerList
    self.noteList = [Note]()
    //Refill the table view with data
    self.tableView.reloadData()
   
    }
        
        print(noteList)
    }
 

    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredNotes = noteList.filter { note in
            let categoryMatch = (scope == "All") || (note.type == scope)
            return  categoryMatch && (note.title!.lowercased().range(of: searchText.lowercased()) != nil)
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredNotes.count
        }
        return noteList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
        let note: Note
        if searchController.isActive && searchController.searchBar.text != "" {
            note = filteredNotes[indexPath.row]
        } else {
            note = noteList[indexPath.row]
        }
        cell.title?.text = note.title
        cell.date?.text = note.getDate()
        //Add icons
        var image = UIImage()
        if note.isKind(of: TextNote.self){
            image = UIImage(named: "textNote")!
        }
        cell.icon.image = image
        
        //Add Locker
        if note.isPasswordProtected(){
            cell.passwordIcon.image = UIImage(named: "password")
        }
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
            let note = noteList[indexPath.row]
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                if note.isKind(of: TextNote.self){
                        controller.textNote = note as? TextNote
                        }
                //make ifs for all kinds of Notes
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true

            
            }
        }
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

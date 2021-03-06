//
//  DetailViewController.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-14.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var dateFooterItem: UIBarButtonItem!
    
    var textNote: TextNote? {
        didSet {
            configureView()
        }
        
    }
    
    func configureView() {
        if let textNote = textNote {
            if let noteTextView = noteTextView{
                noteTextView.text = textNote.text
                title = textNote.title
                dateFooterItem.title = "Created " + textNote.getFullDate()
            }
        }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

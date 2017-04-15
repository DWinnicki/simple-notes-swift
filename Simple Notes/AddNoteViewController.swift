//
//  AddNoteViewController.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-14.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var textNoteIcon: UIImageView!
    @IBOutlet weak var photoNoteIcon: UIImageView!
    @IBOutlet weak var videoNoteIcon: UIImageView!
    @IBOutlet weak var voiceNoteIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    

}

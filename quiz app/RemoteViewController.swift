//
//  RemoteViewController.swift
//  quiz app
//
//  Created by David Horstman on 5/26/20.
//  Copyright © 2020 Leah Frankel. All rights reserved.
//

import UIKit

class RemoteViewController: UIViewController {

    @IBOutlet weak var resultsMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       scoreLabel.text = "You got \(noCorrect) out of \(total)"
        resultsMessageLabel.text = "Hey awesome person!"

// Do any additional setup after loading the view.
    }
    
var noCorrect = 0
    var total = 0
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

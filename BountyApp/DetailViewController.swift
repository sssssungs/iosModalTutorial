//
//  DetailViewController.swift
//  BountyApp
//
//  Created by Randy Won on 2020/03/20.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            imgView.image = UIImage(named: "\(name).jpg")
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }

    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil) //complete : 사라지고 난 후 동작 (callback)
    }


}

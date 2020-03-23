//
//  DetailViewController.swift
//  BountyApp
//
//  Created by Randy Won on 2020/03/20.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // mvvm
    
    // model
    // - BountyInfo obj 만들자.
    
    // view
    // - imgView, nameLavel, bountyLabel
    //  > view들은 viewmodel을 통해 구성
    
    // viewmodel
    // - DetailViewModel 신규생성필요.
    //  > view에서 필요한 메소드 만들기
    //  > model 을 가지고 있어야함.
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let bountyInfo = self.viewModel.bountyInfo {
            imgView.image = UIImage(named: "\(bountyInfo.name).jpg")
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }

    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil) //complete : 사라지고 난 후 동작 (callback)
    }


}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}

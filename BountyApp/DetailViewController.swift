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
    
    // animation var
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
        
    }
    
    private func showAnimation() {
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
////        UIView.animate(withDuration: 0.3) {
////            self.view.layoutIfNeeded()
////        }
//

//

        // 부딪히면서 반동주는 효과
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
//            self.bountyLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
//            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.9, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.nameLabel.transform = CGAffineTransform.identity
            self.bountyLabel.transform = CGAffineTransform.identity
//            self.nameLabel.alpha = 1
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        //        // img view flip 효과
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)

        
        
        
        
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

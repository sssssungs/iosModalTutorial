//
//  BountyViewController.swift
//  BountyApp
//
//  Created by Randy Won on 2020/03/20.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // mvvm
    
    // model
    // - BountyInfo obj 만들자.
    
    // view
    // - ListCell
    //  > ListCell 필요한 정보는 viewmodel 에서 가져오겠다
    //  > listCell은 viewmodel에서 받아서 뷰 업데이트를 하겠다.
    
    // viewmodel
    // - BountyViewModel 신규생성필요.
    //  > view에서 필요한 메소드 만들기
    //  > model 을 가지고 있어야함.
    
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detail view한테 데이터 보냄.
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.viewModel.bountyInfo = viewModel.bountyInfo(at: index)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UICollectionViewDataSource,
    // 몇개를 어떻게 표현
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell
            else {
                return UICollectionViewCell()
                
        }
        cell.update(info: viewModel.bountyInfo(at: indexPath.item))
        return cell
    }
    
    
    // UICollectionViewDelegate,
    // 클릭시 어떤 동작
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // UICollectionViewDelegateFlowLayout
    // cell size를 계산할것 (다양한 기기에 일관적인 사이즈를 위해)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight

        return CGSize(width: width, height: height)
    }
    
    
    
    // 아래 두개는 테이블뷰 필수값
    //UITableViewDataSource: 몇개보여줄건지, 사이즈는 ? 등등
    //UITableViewDelegate : 클릭시 동작
    
    // UITableViewDataSource
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return viewModel.numOfList
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
    //            return UITableViewCell()
    //        }
    //        cell.update(info: viewModel.bountyInfo(at: indexPath.row))
    //        return cell
    //    }
    //
    //    // UITableViewDelegate
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("--> \(indexPath.row)")
    //        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    //    }

}

//    class ListCell: UITableViewCell { // view
//
//        @IBOutlet weak var imgView: UIImageView!
//        @IBOutlet weak var nameLabel: UILabel!
//        @IBOutlet weak var bountyLabel: UILabel!
//
//        func update(info: BountyInfo) {
//            imgView.image = info.image
//            nameLabel.text = info.name
//            bountyLabel.text = "\(info.bounty)"
//        }
//
//    }

class GridCell: UICollectionViewCell { // view
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
    
}


class BountyViewModel { // viewmodel
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 330000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 40000000),
        BountyInfo(name: "nami", bounty: 1000),
        BountyInfo(name: "robin", bounty: 24500000),
        BountyInfo(name: "sanji", bounty: 12),
        BountyInfo(name: "zoro", bounty: 330000),
    ];
    
    var sortedList: [BountyInfo] {
        let result = bountyInfoList.sorted { prev, next in
               return prev.bounty > next.bounty
           }
        return result
    }
    
    var numOfList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
    
}

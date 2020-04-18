//
//  ViewController.swift
//  yesy
//
//  Created by Taras Tomchuk on 13.04.2020.
//  Copyright © 2020 com.news.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupCollectionViewDataSource()
    }
    
    func setupCollectionViewDataSource() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = customCollectionView.bounds.size
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        customCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        customCollectionView.collectionViewLayout = layout
        customCollectionView.isPagingEnabled = true
        customCollectionView.register(UINib(nibName: "LogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LogCollectionViewCell")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width, height: frameSize.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath)
            guard let logCell = cell as? LogCollectionViewCell else { return cell }
            
            logCell.setupData(logItems: LogSymptom.list)
            
            return logCell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath)
            guard let logCell = cell as? LogCollectionViewCell else { return cell }
            
            logCell.setupData(logItems: LogSymptom.list)
            
            return logCell
        default:
            return UICollectionViewCell()
        }
    }
}

//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    private lazy var dictionaryMainModel = DictionaryMainModel()
    
    private lazy var dictionaryMainView: DictionaryMainView? = {
        let view = DictionaryMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = dictionaryMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryMainView?.createMainView()
        dictionaryMainView?.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Main")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension DictionaryViewController: DictionaryMainViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Main", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = .gray
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func arrayButtonPressed() {
        dictionaryMainView?.arrayButton.update()
        dictionaryMainView?.arrayButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryMainModel.createContactsArray()
            self.dictionaryMainView?.arrayButton.stopActivityIndicator()
            self.dictionaryMainView?.arrayButton.setTitle(AppConstants.buttonsTitles[0], for: .normal)
        }
    }
    
    func dictionaryButtonPressed() {
        dictionaryMainView?.dictionaryButton.update()
        dictionaryMainView?.dictionaryButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryMainModel.createContactsDictionary()
            self.dictionaryMainView?.dictionaryButton.stopActivityIndicator()
            self.dictionaryMainView?.dictionaryButton.setTitle(AppConstants.buttonsTitles[1], for: .normal)
        }
    }
}

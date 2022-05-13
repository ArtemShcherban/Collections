//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

final class DictionaryViewController: UIViewController {
    var globalQueue: Dispatching!
    var mainQueue: Dispatching!
    
    private(set) lazy var dictionaryWorkingModel = DictionaryWorkingModel()
    private(set) lazy var timeMeasureModel = TimeMeasureModel.shared
    private(set) lazy var dictionaryMainView: DictionaryMainView? = {
        let view = DictionaryMainView()
        view.delegate = self
        view.collectionViewDelegate = self
        return view
    }()
    
    override func loadView() {
        view = dictionaryMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryMainView?.createMainView()
        globalQueue = AsyncQueue.global
        mainQueue = AsyncQueue.main
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: DictionaryViewController.self)
    }
}

extension DictionaryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { fatalError(ErrorConstants.cannotGetCell.rawValue + "\(indexPath)") }
        
        didSelect(cell, at: indexPath)
    }
    
    func didSelect(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        cell.titleUpdate()
        cell.activityIndicator.startAnimating()
        globalQueue.dispatch {
            self.dictionaryWorkingModel.startTaskAt(indexPath, with: DictionaryConstants.elementsForSearch)
            self.mainQueue.dispatch {
                cell.activityIndicator.stopAnimating()
                cell.updateBackgroundColor()
                cell.titleUpdate(self.dictionaryWorkingModel.createNewTitle())
            }
        }
    }
}

extension DictionaryViewController: DictionaryMainViewDelegate {
    
    func arrayButtonPressed() {
        dictionaryMainView?.arrayButton.update()
        dictionaryMainView?.arrayButton.startActivityIndicator()
        globalQueue.dispatch {
            self.dictionaryWorkingModel.createContactsArray(with: AppConstants.maximumElements)
            self.mainQueue.dispatch {
                self.dictionaryMainView?.arrayButton.stopActivityIndicator()
                self.dictionaryMainView?.arrayButton.update(self.timeMeasureModel.timeInterval)
            }
        }
    }
    
    func dictionaryButtonPressed() {
        dictionaryMainView?.dictionaryButton.update()
        dictionaryMainView?.dictionaryButton.startActivityIndicator()
        globalQueue.dispatch {
            self.dictionaryWorkingModel.createContactsDictionary(with: AppConstants.maximumElements)
            self.mainQueue.dispatch {
                self.dictionaryMainView?.dictionaryButton.stopActivityIndicator()
                self.dictionaryMainView?.dictionaryButton.update(self.timeMeasureModel.timeInterval)
            }
        }
    }
}

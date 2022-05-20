//
//  ArrayViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class ArrayViewController: UIViewController {
    static let reuseIdentifier = String(describing: ArrayViewController.self)
    
    var globalQueue: Dispatching!
    var mainQuaue: Dispatching!
    
    private(set) lazy var arrayMainModel = ArrayMainModel.shared
    private(set) lazy var timeMeasureModel = TimeMeasureModel.shared
    private(set) lazy var arrayMainView: ArrayMainView = {
        let view = ArrayMainView()
        view.delegate = self
        view.collectionViewDelegate = self
        return view
    }()
    
    override func loadView() {
        view = arrayMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMainView.createMainView()
        globalQueue = AsyncQueue.global
        mainQuaue = AsyncQueue.main
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: ArrayViewController.self)
    }
}

extension ArrayViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        else { fatalError(ErrorConstants.cannotGetCell.rawValue + "\(indexPath)") }
        
        didSelect(cell, at: indexPath)
    }
    
    func didSelect(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        cell.activityIndicator.startAnimating()
        cell.titleUpdate()
        globalQueue.dispatch {
            self.arrayMainModel.startTask(indexPath)
            self.mainQuaue.dispatch {
                cell.activityIndicator.stopAnimating()
                cell.updateAppearance()
                cell.titleUpdate(self.timeMeasureModel.timeInterval)
            }
        }
    }
}

extension ArrayViewController: ArrayMainViewDelegate {
    func bigButtonTapped() {
        if arrayMainView.bigButton.isSelected == false {
            arrayMainView.bigButton.update()
            arrayMainView.bigButton.startActivityIndicator()
            globalQueue.dispatch {
                self.arrayMainModel.createArray(with: AppConstants.maximumElements)
                self.mainQuaue.dispatch {
                    self.arrayMainView.bigButton.stopActivityIndicator()
                    self.arrayMainView.bigButton.update(self.timeMeasureModel.timeInterval)
                    self.arrayMainView.addCollectionView()
                }
            }
        }
    }
}

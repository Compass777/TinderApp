//
//  MainScreenViewController.swift
//  TinderApp
//
//  Created by Serg on 11.02.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import UIKit
import UtilsSwippableView

class MainScreenViewController: UIViewController {
    
    @IBOutlet private weak var swippableView: SwippableView!
    
    private let viewModel: InterfaceMainScreenViewModel
    private let identifier = "MainScreenViewController"
    
    init(viewModel: InterfaceMainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: identifier, bundle: Bundle(identifier: identifier))
        
        self.viewModel.state.bind { [weak self] state in
            guard let self = self else { return }
            
            switch state {
            case .initial:
                return
            case .finishedLoad:
                self.swippableView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swippableView.layer.cornerRadius = 10
        //swippableView.clipsToBounds = true
        
        let viewNib = UINib(nibName: "SwippableView", bundle: nil)
        swippableView.registerNib(nib: viewNib)
        swippableView.dataSource = self
        swippableView.delegate = self
        
        viewModel.getTinderData()
    }
    
   

}

extension MainScreenViewController: SwippableViewDelegate, SwippableViewDataSource {
    func willSwiped(index: Int, direction: swipeDirection) {
        
    }
    
    func view(view: UIView, atIndex index: Int) {
        
    }
    
    func numberOfViews() -> Int {
        return 10
    }
    
    
}

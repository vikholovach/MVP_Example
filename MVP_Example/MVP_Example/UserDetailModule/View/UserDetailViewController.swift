//
//  UserDetailViewController.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

class UserDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var userInfoView: UIView!
    @IBOutlet var lablesSet: [UILabel]!
    
    //presenter
    var presenter: UserDetailViewPresenterProtocol!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //tell presenter that our UI is ready to show info
        presenter.prepareUser()
        
        setUI()
    }
    
    //MARK: - Methods
    private func setUI() {
        self.userInfoView.layer.cornerRadius = 10
        self.userInfoView.backgroundColor = .lightGray.withAlphaComponent(0.2)
    }
    
}

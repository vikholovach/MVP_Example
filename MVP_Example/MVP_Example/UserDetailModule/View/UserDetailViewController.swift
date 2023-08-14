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
    @IBOutlet private var lablesSet: [UILabel]!
    
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

extension UserDetailViewController: UserDetailViewProtocol {
    func showUser(with user: User) {
        self.lablesSet.forEach { label in
            //all labels got tag
            switch label.tag {
            case 0:
                //name
                label.text = user.name
            case 1:
                //username
                label.text = user.username
            case 2:
                //email
                label.text = user.email
            case 3:
                //phone
                label.text = user.phone
            case 4:
                //website
                label.text = user.website
            default:
                return
            }
        }
    }
    
    
}
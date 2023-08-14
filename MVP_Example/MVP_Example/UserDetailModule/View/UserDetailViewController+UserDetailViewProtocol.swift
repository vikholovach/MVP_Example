//
//  UserDetailViewController+UserDetailViewProtocol.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import UIKit

extension UserDetailViewController: UserDetailViewProtocol {
    
    func showUser(with user: User?) {
        self.lablesSet.forEach { label in
            //all labels got tag
            switch label.tag {
            case 0:
                //name
                label.text = user?.name
            case 1:
                //username
                label.text = user?.username
            case 2:
                //email
                label.text = user?.email
            case 3:
                //phone
                label.text = user?.phone
            case 4:
                //website
                label.text = user?.website
            default:
                return
            }
        }
    }
}

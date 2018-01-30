//
//  UserPagePresenter.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import Result

protocol UserPageView: class {
    func showIcon(url: String)
    func showName(name: String)
    func showLocation(location: String)
    func showErrorView()
    func showIndicator()
    func hideErrorView()
    func hideIndicator()
}

class UserPagePresenter {
    private weak var view: UserPageView?
    private let userService: UserServiceProtocol

    init(view: UserPageView, userService: UserServiceProtocol = UserService()) {
        self.view = view
        self.userService = userService
    }

    func show() {
        view?.showIndicator()
        userService.getProfile { [weak self] result in
            switch result {
            case .success(let user):
                self?.view?.hideIndicator()
                self?.view?.showIcon(url: user.imageURL ?? "")
                self?.view?.showName(name: user.name)
                self?.view?.showLocation(location: user.location ?? "")
            case .failure:
                self?.view?.hideIndicator()
                self?.view?.showErrorView()
            }
        }
    }
}

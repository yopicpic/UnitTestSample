//
//  ViewController.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import UIKit
import Nuke

class UserPageViewController: UIViewController, UserPageView {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    private var loadingErrorView: LoadingErrorView!
    private var loadingView: LoadingView!

    private var presenter: UserPagePresenter!

    override func viewDidLoad() {
        loadingErrorView =  LoadingErrorView.instantiate()
        loadingErrorView.isHidden = true
        view.addSubview(loadingErrorView)
        loadingErrorView.applyAllEdgeEqualToSuperView()
        // 再読み込みボタンを押した時の挙動は省略

        loadingView = LoadingView.instantiate()
        loadingView.isHidden = true
        view.addSubview(loadingView)
        loadingView.applyAllEdgeEqualToSuperView()

        presenter = UserPagePresenter(view: self)
        presenter.show()
    }

    func showIcon(url: String) {
        guard let url = URL(string: url) else { return }
        
        Manager.shared.loadImage(with: url, into: icon)
    }

    func showName(name: String) {
        self.name.text = name
    }

    func showLocation(location: String) {
        self.location.text = location
    }

    func showErrorView() {
        loadingErrorView.isHidden = false
    }

    func showIndicator() {
        loadingView.isHidden = false
    }

    func hideErrorView() {
        loadingErrorView.isHidden = true
    }

    func hideIndicator() {
        loadingView.isHidden = true
    }
}

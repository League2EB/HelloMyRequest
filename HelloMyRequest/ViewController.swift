//
//  ViewController.swift
//  HelloMyRequest
//
//  Created by Lazy on 2019/10/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.featchData { (result) in
            dump(result)
            debugPrint("你可能想刷新UI?")
        }
    }
}


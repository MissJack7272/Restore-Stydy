//
//  LastVC.swift
//  Restore Stydy
//
//  Created by MissJack on 2019/9/26.
//  Copyright © 2019 missjack. All rights reserved.
//

import UIKit

class LastVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
       
    }
    
    func configUI() {
        view.backgroundColor = .white
        restorationIdentifier = "LastVC"
        restorationClass = LastVC.self
    }
    
    
}
// MARK: - Restore 恢复页面
extension LastVC {
    override func applicationFinishedRestoringState() {
        print("Finished restoring everything.")
    }
}
// MARK: - UIViewControllerRestoration
extension LastVC: UIViewControllerRestoration {
    static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        let vc = LastVC()
        return vc
    }
}


//
//  SecondVC.swift
//  Restore Stydy
//
//  Created by MissJack on 2019/9/26.
//  Copyright © 2019 missjack. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var inputTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = true
    }
    
    @IBAction func nextItemMethod(_ sender: UIBarButtonItem) {
        let pushVC = LastVC()
        navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
}
// MARK: - Restore 恢复页面
extension SecondVC {
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let input = inputTF.text else { return }
    
        coder.encode(input, forKey: MJStringMannager.encodingKeyFieldValue)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        assert(isViewLoaded, "We assume the controller is never restored without loading its view first.")
        inputTF.text = coder.decodeObject(forKey: MJStringMannager.encodingKeyFieldValue) as? String
    }
    
    override func applicationFinishedRestoringState() {
        print("\(type(of: self)) restoring ")
    }
}

extension MJStringMannager {
    static let encodingKeyFieldValue = "encodingKeyFieldValue"
}

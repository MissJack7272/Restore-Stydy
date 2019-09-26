//
//  ViewController.swift
//  Restore Stydy
//
//  Created by MissJack on 2019/9/26.
//  Copyright © 2019 missjack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}
// MARK: - Restore 恢复页面
extension ViewController {
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let loadedSlider = progressSlider, isViewLoaded else { return }
        coder.encode(loadedSlider.value, forKey: MJStringMannager.encodingKeyProgressValue)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        assert(isViewLoaded, "We assume the controller is never restored without loading its view first.")
        progressSlider?.value = coder.decodeFloat(forKey: MJStringMannager.encodingKeyProgressValue)
    }
    
    override func applicationFinishedRestoringState() {
        print("\(type(of: self)) restoring ")
    }
}

extension MJStringMannager {
    static let encodingKeyProgressValue = "encodingKeyProgressValue"
}


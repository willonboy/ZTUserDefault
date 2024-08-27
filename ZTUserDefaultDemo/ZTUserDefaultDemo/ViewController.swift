//
//  ViewController.swift
//  ZTUserDefaultDemo
//
//  Created by trojan on 2024/8/27.
//

import UIKit
import Combine

class ViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("before \(Settings.name)")
        Settings.update()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5, execute: DispatchWorkItem(block: {
            Settings.update2()
        }))
        
        Settings.$name.sink { name in
            print("\(name)")
        }
        .store(in: &cancellables)
    }


}


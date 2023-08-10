//
//  ViewController.swift
//  ATTAMetal
//
//  Created by Jacob Bartlett on 09/08/2023.
//

import UIKit
import MetalKit

final class ViewController: UIViewController {
    
    var metalView: MetalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let metalDevice = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal is not supported on this device")
        }
        
        metalView = MetalView(frame: view.bounds, device: metalDevice)
        view.addSubview(metalView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Any additional setup or method calls you want to perform before the view appears.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Any cleanup or method calls you want to perform before the view disappears.
    }
}

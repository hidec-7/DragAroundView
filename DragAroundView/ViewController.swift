//
//  ViewController.swift
//  DragAroundView
//
//  Created by hideto c. on 2021/06/17.
//

import UIKit

class ViewController: UIViewController {
    
    private var isDragging = false
    
    private let myView: UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .link
        view.isUserInteractionEnabled = true
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myView.center = view.center
    }
    
    var oldX: CGFloat = 0
    var oldY: CGFloat = 0
}

// MARK: - Touches
extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: myView)
        
        oldX = location.x
        oldY = location.y
        
        if myView.bounds.contains(location) {
            isDragging = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first else { return }
        
        let location = touch.location(in: view)
        
        myView.frame.origin.x = location.x - (myView.frame.size.width / 2)
        myView.frame.origin.y = location.y - (myView.frame.size.height / 2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragging = false
    }
}

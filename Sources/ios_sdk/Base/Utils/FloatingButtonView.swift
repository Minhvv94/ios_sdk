//
//  FloatingButtonView.swift
//  
//
//  Created by Minh Vu on 04/08/2022.
//

import Foundation
@objc(FloatingButtonView)
class FloatingButtonView: UIView {
    // properties
    private let removeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kéo vào chỗ này để ẩn"
        label.textAlignment = .center
        return label
    }()
    
    private var originalCenter: CGPoint = .zero
    
    var tapBlock: (() -> Void)?
    var removeBlock: (() -> Void)?
    
    // initial
    init() {
        super.init(frame: .zero)
        self.configView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.height / 2
    }
    
    // private
    private func configView() {
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandle(_:)))
        addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panHanlde(_:)))
        addGestureRecognizer(panGesture)
    }
    
    // event
    @objc func tapHandle(_ sender: UITapGestureRecognizer) {
        tapBlock?()
    }
    
    @objc func panHanlde(_ sender: UIPanGestureRecognizer) {
        guard let view = sender.view else { return }
        guard let superview = view.superview else { return }
        
        if sender.state == .began {
            originalCenter = view.center
            removeLabel.alpha = 0
            superview.addSubview(removeLabel)
            removeLabel.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            removeLabel.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            removeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            removeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
            
            UIView.animate(withDuration: 0.3) {
                self.removeLabel.alpha = 1
            }
        }
        else if sender.state == .changed {
            let translation = sender.translation(in: superview)
            let safeAreaInsets = superview.safeAreaInsets
            var newCenterX = originalCenter.x + translation.x
            var newCenterY = originalCenter.y + translation.y
            
            // kiểm tra đảm bảo di chuyển không ra khỏi safe area view
            if newCenterX <= safeAreaInsets.left + view.frame.size.width / 2 {
                newCenterX = safeAreaInsets.left + view.frame.size.width / 2
            }
            if newCenterX >= superview.frame.size.width - safeAreaInsets.right - view.frame.size.width / 2 {
                newCenterX = superview.frame.size.width - safeAreaInsets.right - view.frame.size.width / 2
            }
            if newCenterY <= safeAreaInsets.top {
                newCenterY = safeAreaInsets.top
            }
            if newCenterY >= superview.frame.size.height - safeAreaInsets.bottom {
                newCenterY = superview.frame.size.height - safeAreaInsets.bottom
            }
            //
            view.center = CGPoint(x: newCenterX, y: newCenterY)
        }
        else if sender.state == .ended {
            if view.frame.intersects(removeLabel.frame) {
                removeBlock?()
                view.removeFromSuperview()
                removeLabel.removeFromSuperview()
            }
            else {
                var newCenterX: CGFloat = safeAreaInsets.left + view.frame.size.width / 2
                let newCenterY: CGFloat = view.center.y
                if view.center.x > superview.frame.size.width / 2 {
                    newCenterX = superview.frame.size.width - safeAreaInsets.right - view.frame.size.width / 2
                }
                UIView.animate(withDuration: 0.3) {
                    view.center = CGPoint(x: newCenterX, y: newCenterY)
                    self.removeLabel.alpha = 0
                } completion: { (_) in
                    self.originalCenter = .zero
                    self.removeLabel.removeFromSuperview()
                }
            }
        }
    }
    
}

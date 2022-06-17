//
//  BaseViewController.swift
//  Sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class BaseViewController: UIViewController {
    internal let alert_svg_template = "svg-renderas-template"
    internal let alert_svg_original = "svg-renderas-original"
    internal let alert_png_template = "png-renderas-template"
    internal let alert_png_original = "png-renderas-original"
    
    final let types: [TintType] = [.normal, .tintOnImage, .tintOnView]
    let mainColor = UIColor(named: "image-color") ?? .yellow

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: self.view.frame)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.insetsLayoutMarginsFromSafeArea = true
        return stackView
    }()
    
    var horizontalStackViewLeft: UIStackView?
    var horizontalStackViewRight: UIStackView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(stackView)
        
        horizontalStackViewLeft = createHorizontalStackView()
        horizontalStackViewRight = createHorizontalStackView()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(horizontalStackViewLeft!)
        stackView.addArrangedSubview(horizontalStackViewRight!)
    }
    
    func createHorizontalStackView() -> UIStackView {
        let horStackView = UIStackView(frame: self.view.frame)
        horStackView.alignment = .fill
        horStackView.distribution = .fillEqually
        horStackView.axis = .vertical
        horStackView.spacing = 6
        return horStackView
    }
}


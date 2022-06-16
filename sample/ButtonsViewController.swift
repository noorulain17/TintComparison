//
//  ButtonsViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class ButtonsViewController: UIViewController {
    let alert_svg_template = "svg-renderas-template"
    let alert_svg_original = "svg-renderas-original"
    let alert_png_template = "png-renderas-template"
    let alert_png_original = "png-renderas-original"
    
    let types = ["- normal", "- tint on image", "- tint on button"]

    var mainColor: UIColor = UIColor(named: "button-color") ?? .green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Tint for Buttons"
        
        // Do any additional setup after loading the view.
        let stackView = UIStackView(frame: self.view.frame)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.insetsLayoutMarginsFromSafeArea = true
        
        view.addSubview(stackView)
        
        let horStackView1 = createaHorStackView()
        let horStackView2 = createaHorStackView()
        
        stackView.addArrangedSubview(horStackView1)
        stackView.addArrangedSubview(horStackView2)
        view.addSubview(stackView)

        for item in [alert_svg_original, alert_svg_template] {
            for (index, _) in types.enumerated() {
                let rowView = getButton(for: item, index: index)
                horStackView1.addArrangedSubview(rowView)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for (index, _) in types.enumerated() {
                let rowView = getButton(for: item, index: index)
                horStackView2.addArrangedSubview(rowView)
            }
        }
    }

    func getButton(for imageName: String, index: Int) -> (UIButton) {
        let button = UIButton()
        button.setTitle("\(imageName) \(types[index])", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.numberOfLines = 0
        var image = UIImage(named: imageName)
        if index == 1 {
            image = image?.withTintColor(mainColor)
        }
        button.setImage(image, for: .normal)
        if index == 2 {
            button.imageView?.tintColor = mainColor
        }
        
        return button
    }
    
    func createaHorStackView() -> UIStackView {
        let horStackView = UIStackView(frame: self.view.frame)
        horStackView.alignment = .fill
        horStackView.distribution = .fillEqually
        horStackView.axis = .vertical
        horStackView.spacing = 6
        return horStackView
    }
    
}

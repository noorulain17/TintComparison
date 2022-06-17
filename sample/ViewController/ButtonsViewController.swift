//
//  ButtonsViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class ButtonsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tint for Buttons"
    
        for item in [alert_svg_original, alert_svg_template] {
            for type in types {
                let rowView = getButton(for: item, type: type)
                horizontalStackViewLeft?.addArrangedSubview(rowView)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for type in types {
                let rowView = getButton(for: item, type: type)
                horizontalStackViewRight?.addArrangedSubview(rowView)
            }
        }
    }

    func getButton(for imageName: String, type: TintType) -> UIButton {
        let button = UIButton()
        button.setTitle("\(imageName) - \(type.rawValue)", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.numberOfLines = 0
        var image = UIImage(named: imageName)
        if type == .tintOnImage {
            image = image?.withTintColor(mainColor)
        }
        button.setImage(image, for: .normal)
        if type == .tintOnView {
            button.imageView?.tintColor = mainColor
        }
        
        return button
    }

}

//
//  ImagesInLabelViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class ImagesInLabelViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tint for Images in NSAttributedText"
    
        let horStackView1 = createHorizontalStackView()
        let horStackView2 = createHorizontalStackView()
        
        stackView.addArrangedSubview(horStackView1)
        stackView.addArrangedSubview(horStackView2)

        for item in [alert_svg_original, alert_svg_template] {
            for type in types {
                let rowView = getLabel(for: item, type: type)
                horStackView1.addArrangedSubview(rowView)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for type in types {
                let rowView = getLabel(for: item, type: type)
                horStackView2.addArrangedSubview(rowView)
            }
        }
    }

    func getLabel(for imageName: String, type: TintType) -> UILabel {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "\(imageName) - \(type.rawValue)")
        label.numberOfLines = 0
        if let image = UIImage(named: imageName) {
            if type == .tintOnImage {
                let infoIcon = NSTextAttachment(image: image.withTintColor(mainColor))
                let infoIconAttributedString = NSMutableAttributedString(attachment: infoIcon)
                text.append(infoIconAttributedString)
            } else {
                let infoIcon = NSTextAttachment(image: image)
                let infoIconAttributedString = NSMutableAttributedString(attachment: infoIcon)
                text.append(infoIconAttributedString)
            }
        }
        if type == .tintOnView {
            label.tintColor = mainColor
        }
        label.attributedText = text
                
        return label
    }

}


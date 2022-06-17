//
//  ViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-15.
//

import UIKit

class ImagesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tint for Images & ImageViews"
                        
        let horStackView1 = createHorizontalStackView()
        let horStackView2 = createHorizontalStackView()
        
        stackView.addArrangedSubview(horStackView1)
        stackView.addArrangedSubview(horStackView2)

        for item in [alert_svg_original, alert_svg_template] {
            for type in types {
                let rowViews = getLabelAndImageView(for: item, type: type)
                horStackView1.addArrangedSubview(rowViews.0)
                horStackView1.addArrangedSubview(rowViews.1)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for type in types {
                let rowViews = getLabelAndImageView(for: item, type: type)
                horStackView2.addArrangedSubview(rowViews.0)
                horStackView2.addArrangedSubview(rowViews.1)
            }
        }
    }

    func getLabelAndImageView(for imageName: String, type: TintType) -> (UILabel, UIImageView) {
        let label = UILabel()
        label.text = "\(imageName) - \(type.rawValue)"
        label.numberOfLines = 0
        var image = UIImage(named: imageName)
        if type == .tintOnImage {
            image = image?.withTintColor(mainColor)
        }
        let imageView = UIImageView(image: image)
        if type == .tintOnView {
            imageView.tintColor = mainColor
        }
        imageView.contentMode = .scaleAspectFit
        
        return (label, imageView)
    }
}


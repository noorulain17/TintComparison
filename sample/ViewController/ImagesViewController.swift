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

        for item in [alert_svg_original, alert_svg_template] {
            for type in types {
                let rowViews = getLabelAndImageView(for: item, type: type)
                horizontalStackViewLeft?.addArrangedSubview(rowViews.0)
                horizontalStackViewLeft?.addArrangedSubview(rowViews.1)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for type in types {
                let rowViews = getLabelAndImageView(for: item, type: type)
                horizontalStackViewRight?.addArrangedSubview(rowViews.0)
                horizontalStackViewRight?.addArrangedSubview(rowViews.1)
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


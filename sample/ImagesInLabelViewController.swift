//
//  ImagesInLabelViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class ImagesInLabelViewController: UIViewController {
    let alert_svg_template = "svg-renderas-template"
    let alert_svg_original = "svg-renderas-original"
    let alert_png_template = "png-renderas-template"
    let alert_png_original = "png-renderas-original"
    
    let types = ["- normal", "- tint on image", "- tint on label"]
    var mainColor: UIColor = UIColor(named: "image-color") ?? .yellow

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Tint for Images in NSAttributedText"
        
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
                let rowView = getLabel(for: item, index: index)
                horStackView1.addArrangedSubview(rowView)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for (index, _) in types.enumerated() {
                let rowView = getLabel(for: item, index: index)
                horStackView2.addArrangedSubview(rowView)
            }
        }
    }

    func getLabel(for imageName: String, index: Int) -> UILabel {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "\(imageName) \(types[index])")
        label.numberOfLines = 0
        if let image = UIImage(named: imageName) {
            if index == 1 {
                let infoIcon = NSTextAttachment(
                    image: image.withTintColor(mainColor)
                )
                let infoIconAttributedString = NSMutableAttributedString(attachment: infoIcon)
                text.append(infoIconAttributedString)
            } else {
                let infoIcon = NSTextAttachment(
                    image: image
                )
                let infoIconAttributedString = NSMutableAttributedString(attachment: infoIcon)
                text.append(infoIconAttributedString)
            }
        }
        if index == 2 {
            label.tintColor = mainColor
        }
        label.attributedText = text
                
        return label
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


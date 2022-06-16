//
//  ViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-15.
//

import UIKit

class ImagesViewController: UIViewController {
    let alert_svg_template = "svg-renderas-template"
    let alert_svg_original = "svg-renderas-original"
    let alert_png_template = "png-renderas-template"
    let alert_png_original = "png-renderas-original"
    
    let types = ["- normal", "- tint on image", "- tint on ImageView"]
    var mainColor: UIColor = UIColor(named: "image-color") ?? .yellow

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Tint for Images & ImageViews"
        
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
                let rowViews = getLabelAndImageView(for: item, index: index)
                horStackView1.addArrangedSubview(rowViews.0)
                horStackView1.addArrangedSubview(rowViews.1)
            }
        }
      
        for item in [alert_png_original, alert_png_template] {
            for (index, _) in types.enumerated() {
                let rowViews = getLabelAndImageView(for: item, index: index)
                horStackView2.addArrangedSubview(rowViews.0)
                horStackView2.addArrangedSubview(rowViews.1)
            }
        }
    }

    func getLabelAndImageView(for imageName: String, index: Int) -> (UILabel, UIImageView) {
        let label = UILabel()
        label.text = "\(imageName) \(types[index])"
        label.numberOfLines = 0
        var image = UIImage(named: imageName)
        if index == 1 {
            image = image?.withTintColor(mainColor)
        }
        let imageView = UIImageView(image: image)
        if index == 2 {
            imageView.tintColor = mainColor
        }
        imageView.contentMode = .scaleAspectFit
        
        return (label, imageView)
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


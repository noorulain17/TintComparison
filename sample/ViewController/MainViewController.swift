//
//  MainViewController.swift
//  sample
//
//  Created by Noor ul Ain Ali on 2022-06-16.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Main"
        
        let stackView = UIStackView(frame: self.view.frame)
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        
        let tintForButton = UIButton(type: .system)
        tintForButton.setTitle("Tint for Buttons", for: .normal)
        tintForButton.addTarget(self, action: #selector(openButtonTintViewController), for: .touchUpInside)
        
        let tintForImages = UIButton(type: .system)
        tintForImages.setTitle("Tint for Images", for: .normal)
        tintForImages.addTarget(self, action: #selector(openImagesTintViewController), for: .touchUpInside)
     
        let tintForAttributedString = UIButton(type: .system)
        tintForAttributedString.setTitle("Tint for AttributedStrings", for: .normal)
        tintForAttributedString.addTarget(self, action: #selector(openImagesInLabelTintViewController), for: .touchUpInside)
     
        stackView.addArrangedSubview(tintForButton)
        stackView.addArrangedSubview(tintForImages)
        stackView.addArrangedSubview(tintForAttributedString)

        view.addSubview(stackView)
    }
    
    @objc
    func openButtonTintViewController() {
        let viewController = ButtonsViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func openImagesTintViewController() {
        let viewController = ImagesViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func openImagesInLabelTintViewController() {
        let viewController = ImagesInLabelViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

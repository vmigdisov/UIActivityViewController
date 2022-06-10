//
//  ViewController.swift
//  ActivityViewController
//
//  Created by Vsevolod Migdisov on 09.06.2022.
//

import UIKit
import LinkPresentation

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("UIActivityViewController", for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
    }

    @objc func buttonTap() {
        let activityItem = ActivityItemSource(
            title: "Заголовок",
            subtitle: "Описание",
            data: "Данные"
        )
        let ac = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    class ActivityItemSource: NSObject, UIActivityItemSource {
        
        var title: String
        var subtitle: String
        var data: String
        
        init(title: String, subtitle: String, data: String) {
            self.title = title
            self.subtitle = subtitle
            self.data = data
            super.init()
        }
        
        func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
            return title
        }

        func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
            return data
        }
      
        public func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
            let metadata = LPLinkMetadata()
            metadata.title = title
            if let image = UIImage(named: "activityImage") {
                metadata.iconProvider = NSItemProvider(object: image)
            }
            metadata.originalURL = URL(fileURLWithPath: subtitle)
            return metadata
        }
    }
}


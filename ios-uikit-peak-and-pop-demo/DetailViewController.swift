//
//  DetailViewController.swift
//  ios-uikit-peak-and-pop-demo
//
//  Created by Eiji Kushida on 2017/04/28.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var fileName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: fileName)
    }

    /// Peak quick Actionsを実装する
    override var previewActionItems: [UIPreviewActionItem] {

        let action1 = UIPreviewAction(title: "Action One",
                                      style: .destructive,
                                      handler: { previewAction, viewController in
                                        print("Action One Selected")
        })

        let groupAction1 = UIPreviewAction(title: "Group Action One",
                                           style: .default,
                                           handler: { previewAction, viewController in
                                            print("Group Action One Selected")
        })

        let groupAction2 = UIPreviewAction(title: "Group Action Two",
                                           style: .default,
                                           handler: { previewAction, viewController in
                                            print("Group Action Two Selected")
        })

        let groupActions = UIPreviewActionGroup(title: "My Action Group...",
                                                style: .default,
                                                actions: [groupAction1, groupAction2])

        return [action1, groupActions]
    }
}

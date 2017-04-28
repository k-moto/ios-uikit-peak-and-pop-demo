//
//  ViewController.swift
//  ios-uikit-peak-and-pop-demo
//
//  Created by Eiji Kushida on 2017/04/28.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = isAvailable3DTouch()
    }

    /// 3D Touchが利用できるか？
    ///
    /// - Returns: 利用の可否
    func isAvailable3DTouch() -> Bool {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
            return true
        } else {
            print("3D Touch Not Available")
            return false
        }
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           viewControllerForLocation location: CGPoint) -> UIViewController? {

        /// プレビューしたい画面を返す
        guard let detailViewController =
            storyboard?.instantiateViewController(
                withIdentifier: "DetailViewController") as?
            DetailViewController else { return nil }

        detailViewController.fileName = "action1"

        detailViewController.preferredContentSize =
            CGSize(width: 0.0, height: UIScreen.main.bounds.size.height * 0.5)

        previewingContext.sourceRect = CGRect(x: 0, y: 0, width: 300, height: 600)

        return detailViewController
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           commit viewControllerToCommit: UIViewController) {

        show(viewControllerToCommit, sender: self)
    }
}


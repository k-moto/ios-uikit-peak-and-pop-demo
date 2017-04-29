# Peak & Pop

## 概要
Viewを強く押し込んだ時に表示されるメニューから操作できるアクションのことです。

## 関連クラス
UIPreviewActionItem、UIPreviewAction、UIPreviewActionGroup、UIViewController

## 1. 利用できるか?
ViewController.swift

```swift:ViewController.swift
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        } else {
            print("3D Touch Not Available")
        }
```
## 2. プレビューしたいViewControllerを設定する
ViewController.swift

```swift:ViewController.swift
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

```
## 3. Peak & Popを実装する
DetailViewController.swift

```swift:ViewController.swift

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

```

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS9.0以上

## 開発環境
|category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.3 |
| iOS | 10.2〜 |

## 参考
https://developer.apple.com/reference/uikit/uipreviewactionitem

https://developer.apple.com/reference/uikit/uipreviewaction

https://developer.apple.com/reference/uikit/uipreviewactiongroup

import UIKit
import ObjectiveC

private var spinnerViewControllerKey: UInt8 = 0

extension UIViewController {

    var spinnerViewController: ProgressSpinnerViewController? {
        get {
            return objc_getAssociatedObject(self, &spinnerViewControllerKey) as? ProgressSpinnerViewController
        }
        set(newValue) {
            objc_setAssociatedObject(self, &spinnerViewControllerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func showActivityIndicator() {
        guard spinnerViewController == nil else { return }

        let spinnerVC = ProgressSpinnerViewController()
        addChild(spinnerVC)
        view.addSubview(spinnerVC.view)
        spinnerVC.didMove(toParent: self)
        spinnerViewController = spinnerVC
        
        print("showed Indicator")
    }

    func hideActivityIndicator() {
        spinnerViewController?.willMove(toParent: nil)
        spinnerViewController?.view.removeFromSuperview()
        spinnerViewController?.removeFromParent()
        spinnerViewController = nil
    }
}

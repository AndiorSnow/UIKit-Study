//
//  UIScrollView.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/11.
//

import UIKit

class ScrollViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var scrollImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 150, height: 200)))
        scrollView.backgroundColor = UIColor.blue
        // Sliding area size
        scrollView.contentSize = CGSize(width: 150 * 2, height: 200 * 2)
        // Sliding area beyond edge insertion content
        scrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // When dragging the view to slide in one direction, whether to lock the slide in the other direction
        scrollView.isDirectionalLockEnabled = false
        // Elastic effect when sliding to the edge
        scrollView.bounces = true
        // Vertical direction always has an elastic effect (even if the sliding area is smaller than the actual area)
        scrollView.alwaysBounceVertical = true
        // isScrollEnabled
        scrollView.isScrollEnabled = true
        // Is the horizontal scrollbar displayed
        scrollView.showsHorizontalScrollIndicator = true
        // Can it be paginated
//        scrollView.isPagingEnabled = true
//        let view1 = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 200))
//        view1.backgroundColor = UIColor.green
//        scrollView.addSubview(view1)
//        let view2 = UIImageView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width - 100, height: 200))
//        view2.backgroundColor = UIColor.red
//        scrollView.addSubview(view2)
        
        scrollImage = UIImageView(frame: scrollView.bounds)
        scrollImage.image = UIImage(named: "iOS Swift")
        scrollView.addSubview(scrollImage)
        // Minimum and maximum zoom factor for sliding views
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        scrollView.delegate = self
        view.addSubview(scrollView)
        
    }
    

}

extension ScrollViewController: UIScrollViewDelegate {
    
    // Implement View Zoom
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollImage
    }
    
    // View Zoom Effect
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        // Center the image
        let offSetX = scrollView.bounds.width > scrollView.contentSize.width ? (scrollView.bounds.width - scrollView.contentSize.width) * 0.5 : 0.0
        let offSetY = scrollView.bounds.height > scrollView.contentSize.height ? (scrollView.bounds.height - scrollView.contentSize.height) * 0.5 : 0.0
        scrollImage.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offSetX, y: scrollView.contentSize.height * 0.5 + offSetY)
    }
    
    // The view has scrolled
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Offset, default CGPointZero, usually used in delegate methods, for drag distance determination operations
        // The downward sliding offset is greater than or equal to 20
        if scrollView.contentOffset.y >= -20 {
            print("now is \(scrollView.contentOffset.y)")
        }
        print(#fileID + "/" + #function)
    }
    
    // About to start dragging
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print(#fileID + "/" + #function)
    }
    
    // About to release fingers and end dragging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(#fileID + "/" + #function)
    }

    // Has released fingers and end dragging
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(#fileID + "/" + #function)
    }
    
}

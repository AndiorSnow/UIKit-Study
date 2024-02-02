//
//  UICollectionView.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/11.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private let cellID = "cellID"
    private let baseReuseHeaderID = "headerID"
    private let baseReuseFooterID = "footerID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a UICollectionFlowLayout object
        let layout = UICollectionViewFlowLayout()
        // Set margin
        let margin: CGFloat = 8
        let itemW = (view.bounds.width - margin * 4) / 3
        let itemH = itemW
        // The size of each item
        layout.itemSize = CGSize(width: itemW, height: itemH)
        // scroll direction
        layout.scrollDirection = .vertical
        // Minimum spacing between cells along the scroll direction
        layout.minimumLineSpacing = margin
        // Minimum line spacing between cells perpendicular to the scroll direction
        layout.minimumInteritemSpacing = margin
        // The inner tangent distance of each section of cells
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        
        // The size of header/footer view in each section
        layout.headerReferenceSize = CGSize()
        layout.footerReferenceSize = CGSize()
        // Is the header/footer view fixed to the head/foot when scrolling
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionFootersPinToVisibleBounds = true
        
        // Create an object for UICollectionView based on flowlayout
        let collecView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
        collecView.delegate = self
        collecView.dataSource = self
        
        // register cell
        collecView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        // register header/footer view
        collecView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: baseReuseHeaderID)
        collecView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: baseReuseFooterID)
        
        self.view.addSubview(collecView)
    }
    
    
}

extension CollectionViewController: UICollectionViewDataSource {
    
    // number Of Sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // Number of cells per section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 + section * 3
    }
    
    // Edit cell format
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BaseCollectionViewCell
        cell.cellIndex = indexPath.item
        return cell
    }
    
    // Edit header/footer view format
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: baseReuseHeaderID, for: indexPath)
            header.backgroundColor = .purple
            let headerLabel = UILabel(frame: header.bounds)
            headerLabel.text = "The header of No.\(indexPath.section)"
            header.addSubview(headerLabel)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: baseReuseFooterID, for: indexPath)
            footer.backgroundColor = .cyan
            let footerLabel = UILabel(frame: footer.bounds)
            footerLabel.text = "The footer of No.\(indexPath.section)"
            footer.addSubview(footerLabel)
            return footer
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
    // selected item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected the No.\(indexPath.item) item in No.\(indexPath.section) section")
    }
    
    // Implement the following three methods, long press will pop up the editing menu
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {}
}

// flowLayout protocol
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // The size and width settings of the section's header/footer.
    // If fixed, it should be directly set in frame instead of in delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: CGFloat(36 + 10 * section))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: CGFloat(36 + 10 * section))
    }
}

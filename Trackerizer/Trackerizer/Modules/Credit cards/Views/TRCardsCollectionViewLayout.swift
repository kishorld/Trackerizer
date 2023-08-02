//
//  CustomCardFlowLayout.swift
//  Trackerizer
//
//  Created by Kishor LD on 24/07/23.
//

import UIKit

open class TRCardsCollectionViewLayout: UICollectionViewLayout {
    // MARK: - Layout configuration
    var cellWidth: CGFloat = 0.0
    var cellHeight: CGFloat = 0.0
    var noofCards = 0
    public init(width: CGFloat, Height: CGFloat, noOfcards: Int) {
        super.init()
        noofCards = noOfcards
        let finalWidth = width < 430 ? width : 500
        cellWidth = finalWidth
        cellHeight = Height
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var itemSize: CGSize = CGSize(width: cellWidth * 0.60, height: cellHeight) {
      didSet{
        invalidateLayout()
      }
    }

    public var spacing: CGFloat = 10.0 {
      didSet{
        invalidateLayout()
      }
    }
    private let tiltAngle: CGFloat = 7.0
    public lazy var maximumVisibleItems: Int = noofCards {
      didSet{
        invalidateLayout()
      }
    }

    // MARK: UICollectionViewLayout

    override open var collectionView: UICollectionView {
      return super.collectionView!
    }


    override open func prepare() {
      super.prepare()
      assert(collectionView.numberOfSections == 1, "Multiple sections aren't supported!")
    }

    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      let totalItemsCount = collectionView.numberOfItems(inSection: 0)
      let minVisibleIndex = max(Int(collectionView.contentOffset.x) / Int(collectionView.bounds.width), 0)
      let maxVisibleIndex = min(minVisibleIndex + maximumVisibleItems, totalItemsCount)

      let contentCenterX = collectionView.contentOffset.x + (collectionView.bounds.width / 2.0)

      let deltaOffset = Int(collectionView.contentOffset.x) % Int(collectionView.bounds.width)
      let percentageDeltaOffset = CGFloat(deltaOffset) / collectionView.bounds.width
      let visibleIndices = stride(from: minVisibleIndex, to: maxVisibleIndex, by: 1)
      let attributes: [UICollectionViewLayoutAttributes] = visibleIndices.map { index in
        let indexPath = IndexPath(item: index, section: 0)
        return computeLayoutAttributesForItem(indexPath: indexPath,
                                       minVisibleIndex: minVisibleIndex,
                                       contentCenterX: contentCenterX,
                                       deltaOffset: CGFloat(deltaOffset),
                                       percentageDeltaOffset: percentageDeltaOffset)
      }

      return attributes
    }


    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
      return true
    }
  }


  // MARK: - Layout computations

  fileprivate extension TRCardsCollectionViewLayout {

    private func scale(at index: Int) -> CGFloat {
      let translatedCoefficient = CGFloat(index) - CGFloat(self.maximumVisibleItems) / 2
        return CGFloat(pow(0.96, translatedCoefficient))
    }

      private func transform(atCurrentVisibleIndex visibleIndex: Int, percentageOffset: CGFloat) -> CGAffineTransform {
          var rawScale = visibleIndex < maximumVisibleItems ? scale(at: visibleIndex) : 1.0

          if visibleIndex != 0 {
              let previousScale = scale(at: visibleIndex - 1)
              let delta = (previousScale - rawScale) * percentageOffset
              rawScale += delta
          }

          let angleOffset = tiltAngle * percentageOffset
          let rotationAngle = visibleIndex > 0 ? tiltAngle + angleOffset : -angleOffset

          let scaleTransform = CGAffineTransform(scaleX: rawScale, y: rawScale)
          let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle * CGFloat.pi / 180.0)

          return scaleTransform.concatenating(rotationTransform)
      }
    func computeLayoutAttributesForItem(indexPath: IndexPath,
                                         minVisibleIndex: Int,
                                         contentCenterX: CGFloat,
                                         deltaOffset: CGFloat,
                                         percentageDeltaOffset: CGFloat) -> UICollectionViewLayoutAttributes {
      let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
      let visibleIndex = indexPath.row - minVisibleIndex
      attributes.size = itemSize
        let midY = 200.0
      attributes.center = CGPoint(x: contentCenterX + spacing * CGFloat(visibleIndex),
                                  y: midY)
        
      attributes.zIndex = (maximumVisibleItems - visibleIndex)
      attributes.transform = transform(atCurrentVisibleIndex: visibleIndex,
                                            percentageOffset: percentageDeltaOffset)

        switch visibleIndex {
        case 0:
            attributes.center.x -= deltaOffset
            break
        case 1..<maximumVisibleItems:
            // Adjust position for tilted cards
            let offset = (spacing + itemSize.width / 2) * percentageDeltaOffset
            attributes.center.x -= offset
            attributes.center.y -= spacing * percentageDeltaOffset

            if visibleIndex == maximumVisibleItems - 1 {
                attributes.alpha = percentageDeltaOffset
            }
            break
        default:
            attributes.alpha = 0
            break
        }
      return attributes
    }
  }




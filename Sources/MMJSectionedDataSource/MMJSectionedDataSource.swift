import Foundation

@objc public protocol SectionedDataSource: AnyObject {
  
  func numberOfSections() -> Int
  func numberOfItemsInSection(_ section: Int) -> Int
  
  func sectionTitleAt(_ indexPath: IndexPath) -> String
  func itemTitleAt(_ indexPath: IndexPath) -> String
  func sectionlessItemTitleAt( _ index: Int) -> String
  
  func sectionAt(_ indexPath: IndexPath) -> Any?
  func itemAt(_ indexPath: IndexPath) -> Any?
  func sectionlessItemAt( _ index: Int) -> Any?
  
  func itemIsCheckedAt(_ indexPath: IndexPath) -> Bool
  func sectionlessItemIsCheckedAt(_ index: Int) -> Bool
}

    import XCTest
    @testable import MMJSectionedDataSource
    import CollectionUtil
    
    class DataSourceClass {
      let items = ["one", "two", "three", "four"]
      let checked = ["one", "four"]
    }
    
    extension DataSourceClass: SectionedDataSource {
      func numberOfSections() -> Int {
        return 1
      }
      
      func numberOfItemsInSection(_ section: Int) -> Int {
        return items.count
      }
      
      func sectionTitleAt(_ indexPath: IndexPath) -> String {
        return ""
      }
      
      func itemTitleAt(_ indexPath: IndexPath) -> String {
        return items[safe: indexPath.item] ?? "N/A"
      }
      
      func sectionlessItemTitleAt(_ index: Int) -> String {
        let indexPath = IndexPath(item: index, section: 0)
        return itemTitleAt(indexPath)
      }
      
      func sectionAt(_ indexPath: IndexPath) -> Any? {
        return nil
      }
      
      func itemAt(_ indexPath: IndexPath) -> Any? {
        return items[safe: indexPath.item]
      }
      
      func sectionlessItemAt(_ index: Int) -> Any? {
        let indexPath = IndexPath(item: index, section: 0)
        return itemAt(indexPath)
      }
      
      func itemIsCheckedAt(_ indexPath: IndexPath) -> Bool {
        if let item = itemAt(indexPath) as? String {
          return checked.contains(item)
        }
        return false
      }
      
      func sectionlessItemIsCheckedAt(_ index: Int) -> Bool {
        let indexPath = IndexPath(item: index, section: 0)
        return itemIsCheckedAt(indexPath)
      }
      
    }
    
    final class MMJSectionedDataSourceTests: XCTestCase {
      
      static var sut: DataSourceClass!
      
      override class func setUp() {
        sut = DataSourceClass()
      }
      
      func testNumberOfItems() {
        let numberOfItems = MMJSectionedDataSourceTests.sut.numberOfItemsInSection(0)
        XCTAssertEqual(numberOfItems, 4)
      }
      
      func testItemAt() {
        let indexPath = IndexPath(item: 3, section: 0)
        let item = MMJSectionedDataSourceTests.sut.itemAt(indexPath) as? String
        XCTAssertEqual(item, "four")
      }
      
      func testNumberOfSections() {
        let numberOfSections = MMJSectionedDataSourceTests.sut.numberOfSections()
        XCTAssertEqual(numberOfSections, 1)
      }
      
      func testCheckedItemIsChecked() {
        let indexPath = IndexPath(item: 3, section: 0)
        let checkedItemTrue = MMJSectionedDataSourceTests.sut.itemIsCheckedAt(indexPath)
        XCTAssertEqual(checkedItemTrue, true)
      }
      
      func testNonCheckedItemIsNotChecked() {
        let indexPath = IndexPath(item: 2, section: 0)
        let checkedItemFalse = MMJSectionedDataSourceTests.sut.itemIsCheckedAt(indexPath)
        XCTAssertEqual(checkedItemFalse, false)
      }
      
      func testItemTitle() {
        let indexPath = IndexPath(item: 2, section: 0)
        let itemTitle = MMJSectionedDataSourceTests.sut.itemTitleAt(indexPath)
        XCTAssertEqual(itemTitle, "three")
      }
      
      func testSectionlessItemTitle() {
        let itemTitle = MMJSectionedDataSourceTests.sut.sectionlessItemTitleAt(2)
        XCTAssertEqual(itemTitle, "three")
      }
      
    }

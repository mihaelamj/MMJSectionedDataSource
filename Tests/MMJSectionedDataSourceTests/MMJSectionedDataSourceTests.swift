    import XCTest
    @testable import MMJSectionedDataSource
//    import MMJUtils.CollectionUtil
//    import MMJUtils
    import CollectionUtil
    
    class DataSourceClass {
      let items = ["one", "two", "three"]
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
        return ""
      }
      
      func sectionlessItemTitleAt(_ index: Int) -> String {
        return ""
      }
      
      func sectionAt(_ indexPath: IndexPath) -> Any? {
        return nil
      }
      
      func itemAt(_ indexPath: IndexPath) -> Any? {
        return nil
      }
      
      func sectionlessItemAt(_ index: Int) -> Any? {
        let indexPath = IndexPath(item: index, section: 0)
        return itemAt(indexPath)
      }
      
      func itemIsCheckedAt(_ indexPath: IndexPath) -> Bool {
        return false
      }
      
      func sectionlessItemIsCheckedAt(_ index: Int) -> Bool {
        return false
      }
      
      
    }
    
    final class MMJSectionedDataSourceTests: XCTestCase {
      
      func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual("", "Hello, World!")
      }
    }

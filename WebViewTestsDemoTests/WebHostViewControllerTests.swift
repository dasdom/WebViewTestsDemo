//  Created by Dominik Hauser on 06.05.22.
//  
//

import XCTest
@testable import WebViewTestsDemo
import WebKit

class WebHostViewControllerTests: XCTestCase {

  var sut: WebHostViewController!
  // source: https://masilotti.com/set-wkwebview-title/
  var webViewExpectation: XCTestExpectation!

  override func setUpWithError() throws {
    sut = WebHostViewController()
//    sut.loadViewIfNeeded()
  }

  override func tearDownWithError() throws {
    sut = nil
  }

  func test_loading_shouldSetHTML() {
    webViewExpectation = expectation(description: "")
    let async = expectation(description: "async")
    let webView = sut.contentView.webView
    webView.navigationDelegate = self
    sut.loadViewIfNeeded()

    wait(for: [webViewExpectation], timeout: 1)

    var resultHTML: String?
    // source: https://stackoverflow.com/a/57083024/498796
    webView.evaluateJavaScript("document.body.innerHTML") { value, error in

      guard let html = value as? String else {
        XCTFail("Could not fetch html")
        return
      }
      resultHTML = html

      async.fulfill()
    }

    wait(for: [async], timeout: 1)
    XCTAssertEqual(resultHTML?.contains("<h1>Example Domain</h1>"), true)
  }
}

extension WebHostViewControllerTests: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    webViewExpectation.fulfill()
  }
}

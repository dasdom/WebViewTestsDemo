//  Created by Dominik Hauser on 06.05.22.
//  
//

import UIKit

class WebHostViewController: UIViewController {

  var contentView: WebHostView {
    return view as! WebHostView
  }

  override func loadView() {
    let contentView = WebHostView()
    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let fileURL = Bundle.main.url(forResource: "example", withExtension: "html") else {
      return
    }

    do {
      let htmlString = try String(contentsOf: fileURL)
      contentView.webView.loadHTMLString(htmlString, baseURL: nil)
    } catch {
      print("\(#filePath), \(#line): \(error)")
    }
  }
}


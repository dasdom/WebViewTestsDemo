//  Created by Dominik Hauser on 06.05.22.
//  
//

import UIKit
import WebKit

class WebHostView: UIView {

  let webView: WKWebView

  override init(frame: CGRect) {

    webView = WKWebView(frame: frame)
    webView.translatesAutoresizingMaskIntoConstraints = false

    super.init(frame: frame)

    addSubview(webView)

    NSLayoutConstraint.activate([
      webView.topAnchor.constraint(equalTo: topAnchor),
      webView.leadingAnchor.constraint(equalTo: leadingAnchor),
      webView.bottomAnchor.constraint(equalTo: bottomAnchor),
      webView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }

  required init?(coder: NSCoder) { fatalError() }
}

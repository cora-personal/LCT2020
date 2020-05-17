//
//  UIImageView+DownloadImage.swift
//  LCT2020
//
//  Created by My Apps on 17/05/2020.
//  Copyright © 2020 cora. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url,
            completionHandler: { [weak self] url, response, error in
            if error == nil, let url = url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let weakSelf = self {
                        weakSelf.image = image
                    }
                }
            }
    })
        downloadTask.resume()
        return downloadTask
    }
}

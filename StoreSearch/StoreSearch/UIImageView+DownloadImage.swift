//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by YaMing on 11/14/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageWithURL(url: NSURL) -> NSURLSessionDownloadTask {
        let session = NSURLSession.sharedSession()
        
        let downloadTask = session.downloadTaskWithURL(url, completionHandler: {
            [weak self]url, reponse, error in
            if error == nil && url != nil {
                if let data = NSData(contentsOfURL: url) {
                    if let image = UIImage(data: data) {
                        dispatch_async(dispatch_get_main_queue()) {
                            if let strongSelf = self {
                                strongSelf.image = image
                            }
                        }
                    }
                }
            }
        })
        
        downloadTask.resume()
        return downloadTask
    }
}

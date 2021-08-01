//
//  UIImageViewExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/25/16.
//  Copyright © 2016 SwifterSwift
//

import UIKit
import Kingfisher
//import KingfisherWebP
#if !os(watchOS)
// MARK: - Methods
public extension UIImageView {
    func download(url: String?) {
        guard var string = url else { return }
        string = NetworkManager.instance.safeUrl(url: string)
        let url = URL(string: string)
        guard let finalUrl = url else { return }
        //        KingfisherManager.shared.defaultOptions += [
        //            .processor(WebPProcessor.default),
        //            .cacheSerializer(WebPSerializer.default)
        //        ]
//        self.kf.setImage(with: finalUrl)
        self.kf.setImage(with: finalUrl, placeholder: nil)
    }
}
#endif


//
//  VerticalStackView.swift
//  appStoreJSONApis
//
//  Created by Felipe Moura Soares on 23/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubViews.forEach({ addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  TableViewExtensions.swift
//  KQHamaraSchool
//
//  Created by muhammad on 12/7/20.
//

import Foundation
import UIKit

protocol IdentifiableKQ {
	static var Identifier: String {get}
}

extension UITableViewCell: IdentifiableKQ {
	static var Identifier: String { return String(describing: self)}
}

extension UICollectionViewCell: IdentifiableKQ {
	static var Identifier: String { return String(describing: self)}
}

extension UITableViewHeaderFooterView: IdentifiableKQ {
	static var Identifier: String { return String(describing: self)}
}

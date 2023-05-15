//
//  UITableView+Extension.swift
//  Tech Test
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

protocol ReusableView: AnyObject {
  static var reuseIdentifier: String { get }
  static var nib: UINib? { get }
}

extension ReusableView {
  static var reuseIdentifier: String { return String(describing: self) }
  static var nib: UINib? { return UINib(nibName: String(describing: self), bundle: nil) }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

extension UITableView {
    
    func dequeCellFor<T: UITableViewCell>(type: T.Type) -> T  where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to Dequeue Reusable TableViewCell")
        }
        return cell
    }
    
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T where T: ReusableView {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}

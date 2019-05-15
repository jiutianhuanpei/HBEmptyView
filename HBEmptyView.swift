//
//  HBEmptyView.swift
//  TableViewEmpty
//
//  Created by 沈红榜 on 2019/5/14.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit
import ObjectiveC

extension UIScrollView {
    
    private struct HBHookKey {
        static var emptyViewKey = "emptyViewKey"
        static var isShowEmptyViewKey = "isShowEmptyViewKey"
        
    }
    
    /// 无数据占位图
    open var emptyView: UIView? {
        set {
            objc_setAssociatedObject(self, &HBHookKey.emptyViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &HBHookKey.emptyViewKey) as? UIView
        }
    }
    
     /// 是否需要展示占位图，不设置则默认展示，在 TableView 和 CollectionView 中和无数据关联
     open var isShowEmptyView: (()->Bool)? {
        set {
            objc_setAssociatedObject(self, &HBHookKey.isShowEmptyViewKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &HBHookKey.isShowEmptyViewKey) as? ()->Bool
        }
    }
    
    fileprivate var showEmpty: Bool {
        return itemsNumIsZero() && ( isShowEmptyView?() ?? true )
    }
    
    private func itemsNumIsZero() -> Bool {
        
        if self is UITableView {
            
            let tableView = self as! UITableView
            
            var num = 0
            let sections = tableView.numberOfSections
            
            for i in 0..<sections {
                let cells = tableView.numberOfRows(inSection: i)
                if cells > 0 {
                    return false
                }
                num += cells
            }
            
            return num == 0
        } else if self is UICollectionView {
            
            let colView = self as! UICollectionView
            
            let secions = colView.numberOfSections
            
            var num = 0
            
            for i in 0..<secions {
                let cells = colView.numberOfItems(inSection: i)
                if cells > 0 {
                    return false
                }
                num += cells
            }
            return num == 0
            
        }
        
        return true
    }
}

extension UITableView {
    
     private struct HBTabHookStruct {
        static var sepKey = "sepKey"
    }
    
    fileprivate var hb_separatorStyle: UITableViewCell.SeparatorStyle? {
        set {
            objc_setAssociatedObject(self, &HBTabHookStruct.sepKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &HBTabHookStruct.sepKey) as? UITableViewCell.SeparatorStyle
        }
    }
    
    /// 刷新占位图
    open func reloadEmptyView() {
        
        if hb_separatorStyle == nil {
            hb_separatorStyle = separatorStyle
        }
        
        if showEmpty {
            separatorStyle = .none
            backgroundView = emptyView
        } else {
            separatorStyle = hb_separatorStyle ?? .singleLine
            backgroundView = nil
        }
    }
}

extension UICollectionView {
    
    /// 刷新占位图
    open func reloadEmptyView() {
                
        if showEmpty {
            backgroundView = emptyView
        } else {
            backgroundView = nil
        }
    }
}







# HBEmptyView
---


用 swift 写的用于 UITableView 和 UICollectionView 无数据时占位展示。

主要 API 如下：

```swift
extension UIScrollView {

    /// 无数据占位图
    open var emptyView: UIView? { get set }

    /// 是否需要展示占位图，不设置则默认展示，在 TableView 和 CollectionView 中和无数据关联
    open var isShowEmptyView: (() -> Bool)? { get set }
}

extension UITableView {

    /// 刷新占位图
    open func reloadEmptyView()
}

extension UICollectionView {

    /// 刷新占位图
    open func reloadEmptyView()
}
```
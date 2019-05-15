Pod::Spec.new do |s|

  s.name         = "HBEmptyView"
  s.version      = "0.0.1"
  s.summary      = "用于为 UITableView & UICollectionView 添加空白占位图"

  s.description  = <<-DESC
    用于为 UITableView & UICollectionView 添加空白占位图。
                   DESC

  s.homepage     = "https://www.shenhongbang.cc"

  s.license      = "MIT"
  s.author       = { "shenhongbang" => "shenhongbang@163.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/jiutianhuanpei/HBEmptyView.git", :tag => s.version }

  s.source_files  = "HBEmptyView.swift"

  s.frameworks = "UIKit"
  s.requires_arc = true
  s.swift_version = '5.0'

end
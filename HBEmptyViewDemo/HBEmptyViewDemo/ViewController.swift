//
//  ViewController.swift
//  TableViewEmpty
//
//  Created by 沈红榜 on 2019/5/14.
//  Copyright © 2019 沈红榜. All rights reserved.
//

import UIKit

class HBEmptyView: UIImageView {
    
    let btn = UIButton(type: .custom)
    
    init() {
        super.init(frame: .zero)
        image = UIImage(named: "13")
        isUserInteractionEnabled = true
        
        addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false

        btn.setTitle("刷新", for: .normal)
        btn.setTitleColor(.cyan, for: .normal)
        btn.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        
        btn.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        let cy = NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let cx = NSLayoutConstraint.init(item: btn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)

        addConstraint(cx)
        addConstraint(cy)
    }
    
    @objc func clickedBtn(_ btn: UIButton) {
        
        print("clicked refresh btn")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    var tableView = UITableView(frame: .zero, style: .plain)

    var nums = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.tableFooterView = UIView()
 
        
        tableView.emptyView = HBEmptyView()
//        tableView.isShowEmptyView = { true }
        
        tableView.reloadEmptyView()
    }

    //    MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums
    }
    
    @IBAction func clickedBarButton(_ sender: UIBarButtonItem) {
        
        if sender.title == "确定" {
            
            nums = 10
            sender.title = "取消"
            
        } else {
            nums = 0
            sender.title = "确定"
        }
        tableView.reloadData()
        tableView.reloadEmptyView()
    }
    
}


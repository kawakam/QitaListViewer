//
//  QitaListViewController.swift
//  QitaListViewer
//
//  Created by 川上智樹 on 2016/03/25.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit
import AsyncKit

class QitaListViewController: UIViewController, UITableViewDelegate {
    private let qiitaListModel = QiitaListModel()
    
    override func loadView() {
        super.loadView()
        self.view = QiitaListView(model: qiitaListModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "新着記事"
        
        let qiitaListView = view as! QiitaListView
        qiitaListView.table.delegate = self
        qiitaListView.table.dataSource = qiitaListModel
        
        qiitaListModel.articles = GetArticles.getArticles {
            qiitaListView.table.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

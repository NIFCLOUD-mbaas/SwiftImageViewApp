//
//  ViewController.swift
//  SwiftImageViewApp
//
//  Created by Natsumo Ikeda on 2016/10/25.
//  Copyright 2019 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {
    // imageView
    @IBOutlet weak var imageView: UIImageView!
    // label
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // labelの初期化
        label.text = ""
        
    }
    
    // 「Download」ボタン押下時の処理
    @IBAction func download(_ sender: UIBarButtonItem) {
        // 取得する画像ファイル名を設定
        let imageFile : NCMBFile = NCMBFile(fileName: "mBaaS_image.png")
        // 画像ファイルを取得
        imageFile.fetchInBackground(callback: { result in
            switch result {
            case let .success(data):
                // 取得成功時の処理
                print("画像ファイルの取得に成功しました")
                DispatchQueue.main.async {
                    self.label.text = "OK"
                    // 画像を表示する処理
                    self.imageView.image = UIImage(data: data!)
                }
            case let .failure(error):
                print("画像ファイルの取得に失敗しました：\(error)")
                DispatchQueue.main.async {
                    self.label.text = "NG エラーコード：\(error)"
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


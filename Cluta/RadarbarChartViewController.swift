//
//  RadarbarChartViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/10/26.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit
import Charts
class RadarbarChartViewController: UIViewController {
    
    @IBOutlet var RadarChartView: RadarChartView!
    
    var skill:[String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        skill = ["スパイク","カット","フェイント","ブロック","サーブ"]
        let unitsSold = [50, 75, 50, 25, 100]
        
        setChart(dataPoints: skill,values:unitsSold)
        
        
        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Int]) {
        RadarChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = RadarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = RadarChartDataSet(yVals: dataEntries, label: "技術")
        let chartData = RadarChartData(xVals: skill, dataSet: chartDataSet)
        radarChartView.data = chartData
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

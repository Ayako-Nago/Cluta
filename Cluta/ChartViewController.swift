//
//  ChartViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/12/07.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var DataListArray = [[String: Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    let playerData = PlayerData.shared
    let skillArray = ["A","B","C","D","E"]
    var index : Int!
    @IBOutlet var chartView: RadarChartView!
    var independent : [String:Any] = [:]
    var way : Int!
    let activities = ["A", "B", "C", "D", "E"]
    @IBOutlet var ok: UILabel!
    @IBOutlet var ng: UILabel!
    var oknum : Int = 0
    var ngnum : Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! InfoCell
//        DataCell.textLabel!.text = skillArray[indexPath.row]
        if indexPath.row == 0{
            oknum = independent["Aok"] as? Int ?? 0
            ngnum = independent["Ang"] as? Int ?? 0
//            ok.text = String(oknum)
//            ng.text = String(ngnum)
            DataCell.all.text = String(ngnum)
            DataCell.clear.text = String(oknum)
            DataCell.name.text = "A"
        }else if indexPath.row == 1{
            oknum = independent["Bok"] as? Int ?? 0
            ngnum = independent["Bng"] as? Int ?? 0
//            ok.text = String(oknum)
//            ng.text = String(ngnum)
            DataCell.all.text = String(ngnum)
            DataCell.clear.text = String(oknum)
            DataCell.name.text = "B"
        }else if indexPath.row == 2{
            oknum = independent["Cok"] as? Int ?? 0
            ngnum = independent["Cng"] as? Int ?? 0
//            ok.text = String(oknum)
//            ng.text = String(ngnum)
            DataCell.all.text = String(ngnum)
            DataCell.clear.text = String(oknum)
            DataCell.name.text = "C"
        }else if indexPath.row == 3{
            oknum = independent["Dok"] as? Int ?? 0
            ngnum = independent["Dng"] as? Int ?? 0
//            ok.text = String(oknum)
//            ng.text = String(ngnum)
            DataCell.all.text = String(ngnum)
            DataCell.clear.text = String(oknum)
            DataCell.name.text = "D"
        }else if indexPath.row == 4{
            oknum = independent["Eok"] as? Int ?? 0
            ngnum = independent["Eng"] as? Int ?? 0
//            ok.text = String(oknum)
//            ng.text = String(ngnum)
            DataCell.all.text = String(ngnum)
            DataCell.clear.text = String(oknum)
            DataCell.name.text = "E"
        }
        
        return DataCell
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(way ,"viewdidload")
        
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        
        independent = DataListArray[way]
//        var okArray = [independent["Aok"],independent["Bok"],independent["Cok"],independent["Dok"],independent["Eok"]]
//        var ngArray = [independent["Ang"],independent["Bng"],independent["Cng"],independent["Dng"],independent["Eng"]]
        self.title = independent["name"] as! String
        
        tableView.rowHeight = 60
        
        chartView.chartDescription?.enabled = false
        chartView.webLineWidth = 1
        chartView.innerWebLineWidth = 1
        chartView.webColor = .lightGray
        chartView.innerWebColor = .lightGray
        chartView.webAlpha = 1
        
//        let marker = RadarMarkerView.viewFromXib()!
//        marker.chartView = chartView
//        chartView.marker = marker
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .white
        
        let yAxis = chartView.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 5
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 80
        yAxis.drawLabelsEnabled = false
        
        let l = chartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .top
        l.orientation = .horizontal
        l.drawInside = false
        l.font = .systemFont(ofSize: 10, weight: .light)
        l.xEntrySpace = 7
        l.yEntrySpace = 5
        l.textColor = .white
        //        chartView.legend = l
        
        self.updateChartData()
        
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: .easeOutBack)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.15) {
            let navBar = self.navigationController!.navigationBar
//            self.originalBarBgColor = navBar.barTintColor
//            self.originalBarTintColor = navBar.tintColor
//            self.originalBarStyle = navBar.barStyle
            
            navBar.barTintColor = self.view.backgroundColor
            navBar.tintColor = .white
            navBar.barStyle = .black
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        UIView.animate(withDuration: 0.15) {
//            let navBar = self.navigationController!.navigationBar
//            navBar.barTintColor = self.originalBarBgColor
//            navBar.tintColor = self.originalBarTintColor
//            navBar.barStyle = self.originalBarStyle
//        }
    }
    
     func updateChartData() {
        
       
        
        self.setChartData()
    }
    
    func setChartData() {
//        let mult: UInt32 = 80
//        let min: UInt32 = 20
        
//        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))}
        
        
        
        
        let entries1: [RadarChartDataEntry] = [RadarChartDataEntry(value: Double(independent["A"] as! Int)),RadarChartDataEntry(value: Double(independent["B"] as! Int)),RadarChartDataEntry(value: Double(independent["C"] as! Int)),RadarChartDataEntry(value: Double(independent["D"] as! Int)),RadarChartDataEntry(value: Double(independent["E"] as! Int))]
//        let entries2 = (0..<cnt).map(block)
        //
        
        let set1 = RadarChartDataSet(values: entries1, label: "")
        set1.setColor(UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1))
        set1.fillColor = UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 2
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        
//        let set2 = RadarChartDataSet(values: entries2, label: "This Week")
//                set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
//                set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
//                set2.drawFilledEnabled = true
//                set2.fillAlpha = 0.7
//                set2.lineWidth = 2
//                set2.drawHighlightCircleEnabled = true
//                set2.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set1])
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        chartView.data = data
    }
    
//    override func optionTapped(_ option: Option) {
//        switch option {
//        case .toggleXLabels:
//            chartView.xAxis.drawLabelsEnabled = !chartView.xAxis.drawLabelsEnabled
//            chartView.data?.notifyDataChanged()
//            chartView.notifyDataSetChanged()
//            chartView.setNeedsDisplay()
//
//        case .toggleYLabels:
//            chartView.yAxis.drawLabelsEnabled = !chartView.yAxis.drawLabelsEnabled
//            chartView.setNeedsDisplay()
//
//        case .toggleRotate:
//            chartView.rotationEnabled = !chartView.rotationEnabled
//
//        case .toggleFilled:
//            for set in chartView.data!.dataSets as! [RadarChartDataSet] {
//                set.drawFilledEnabled = !set.drawFilledEnabled
//            }
//
//            chartView.setNeedsDisplay()
//
//        case .toggleHighlightCircle:
//            for set in chartView.data!.dataSets as! [RadarChartDataSet] {
//                set.drawHighlightCircleEnabled = !set.drawHighlightCircleEnabled
//            }
//            chartView.setNeedsDisplay()
//
//        case .animateX:
//            chartView.animate(xAxisDuration: 1.4)
//
//        case .animateY:
//            chartView.animate(yAxisDuration: 1.4)
//
//        case .animateXY:
//            chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
//
//        case .spin:
//            chartView.spin(duration: 2, fromAngle: chartView.rotationAngle, toAngle: chartView.rotationAngle + 360, easingOption: .easeInCubic)
//
//        default:
//            super.handleOption(option, forChartView: chartView)
//        }
//    }
}

extension ChartViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count]
    }
    
    
}

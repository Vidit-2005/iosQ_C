//
//  BarChartCollectionViewCell.swift
//  wellSync
//
//  Created by Vidit Agarwal on 04/02/26.
//

import UIKit
import DGCharts

class BarChartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var barChart: BarChartView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        barchart()
    }
    
    func barchart(){
        //        step 1
                let days = ["Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                let values = [28, 50, 60, 30, 42, 91, 52]
                
                // step 2
                var dataEntry: [BarChartDataEntry] = []
                //step 3
                for i in 0..<days.count {
                    let value = BarChartDataEntry(x: Double(i), y: Double(values[i]))
                    dataEntry.append(value)
                }
        //        step 4
                let dataSet = BarChartDataSet(entries: dataEntry, label: "Barchart Unit Test Data")
        //        step 5
                let data = BarChartData(dataSet: dataSet)
                
        //        step 6
                barChart.data = data
                data.barWidth = 0.5
        //        dataSet.colors = [.red, .blue, .yellow, .green, .orange, .purple, .systemCyan]
                dataSet.colors = ChartColorTemplates.material()
                let xAxis = barChart.xAxis
                xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
                xAxis.granularity = 1.0
                barChart.xAxis.labelPosition = .bottom
                barChart.legend.enabled = false
                barChart.leftAxis.enabled = false
        //        barChart.animate(xAxisDuration: 2.0)
                barChart.animate(yAxisDuration: 3.0)
    }
}

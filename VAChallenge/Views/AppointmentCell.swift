//
//  AppointmentCell.swift
//  VAChallenge
//
//  Created by Adil BOUGAMZA on 03/12/2016.
//  Copyright © 2016 Adil Bougamza. All rights reserved.
//

import UIKit
import SnapKit

class AppointmentCell: UITableViewCell {

    public var appointment : Appointment!

    let begindateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()

    let endDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(begindateLabel)
        self.contentView.addSubview(endDateLabel)

        begindateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
            make.height.equalTo(20)
            make.bottom.equalTo(self.contentView.snp.centerY)
        }
        endDateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
            make.height.equalTo(20)
            make.top.equalTo(self.contentView.snp.centerY)
        }

        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setAppointment(appointment : Appointment) {
        self.appointment = appointment
        let dateFormatter :DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"

        begindateLabel.text = "Begin: " + dateFormatter.string(from: appointment.beginDate)
        endDateLabel.text = "End: " + dateFormatter.string(from: appointment.endDate)

    }

}

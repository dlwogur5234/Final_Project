package com.cloud.pt.ptLog;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PtTypeVO {
	
	private Long ptTypeNum;
	private String EmployeeNum;
	private Date ptLogDate;
	private String name;
	private String weight;
	private Long exCount;
	private Long ptSet;
	
}

package edu.zstu.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="FOOD_STEPS")
public class FoodSteps extends BaseEntity {
	private String stepDesc;
	private Integer stepNo;
	
	private FileAttach fileAttach;
	
	@Column(name="STEP_DESC")
	public String getStepDesc() {
		return stepDesc;
	}
	public void setStepDesc(String stepDesc) {
		this.stepDesc = stepDesc;
	}
	@Column(name="STEP_NO")
	public Integer getStepNo() {
		return stepNo;
	}
	public void setStepNo(Integer stepNo) {
		this.stepNo = stepNo;
	}
	@ManyToOne(targetEntity=FileAttach.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="FILE_ID")
	public FileAttach getFileAttach() {
		return fileAttach;
	}
	public void setFileAttach(FileAttach fileAttach) {
		this.fileAttach = fileAttach;
	}
}

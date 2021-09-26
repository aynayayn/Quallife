package edu.zstu.web.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="ACTIVITY_FILE")
public class ActivityFile extends BaseEntity {
	private FileAttach fileAttach;
	private Activity activity;
	
	@ManyToOne(targetEntity=FileAttach.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="FILE_ID")
	public FileAttach getFileAttach() {
		return fileAttach;
	}
	public void setFileAttach(FileAttach fileAttach) {
		this.fileAttach = fileAttach;
	}
	
	@ManyToOne(targetEntity=Activity.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="ACTIVITY_ID")
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
}

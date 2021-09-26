package edu.zstu.web.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

//JPA基类的标识
@MappedSuperclass
public abstract class BaseEntity {
	protected Long id;

	//主键标注
	@Id
	//主键值策略
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	//列标注
	@Column(name="ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}

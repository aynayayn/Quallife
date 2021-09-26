package edu.zstu.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Component;

public interface BaseDao<T> extends JpaRepository<T, Long>, JpaSpecificationExecutor<T> {

}

package com.cloud.pt.ptLog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtTypeDAO {

	public List<PtTypeVO> getTypeList(Map<String, Object> map,String employeeNum) throws Exception;

	public int addType(PtTypeVO ptTypeVO) throws Exception;
	
	public int delType(PtTypeVO ptTypeVO) throws Exception;
	
	public int selectExAll(PtTypeVO ptTypeVO) throws Exception; 
	
	public int selectComplete(PtTypeVO ptTypeVO) throws Exception; 
		
	
}

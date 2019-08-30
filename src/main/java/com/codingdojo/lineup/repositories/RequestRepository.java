package com.codingdojo.lineup.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.lineup.models.Request;

@Repository
public interface RequestRepository extends CrudRepository <Request, Long>{
	List<Request> findAll();
	
	@Query(value="SELECT * FROM requests WHERE employee_id = ?1", nativeQuery=true)
	List<Request> findRequestByEmpId(Long id);
}

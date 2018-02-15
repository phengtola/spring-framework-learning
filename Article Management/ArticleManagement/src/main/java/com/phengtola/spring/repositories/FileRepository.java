package com.phengtola.spring.repositories;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.phengtola.spring.entities.File;

/**
 * 
 * @author Tola
 *	Created Date: 2017/06/27
 */
@Repository
public interface FileRepository {

	@Insert("<script>"
			+ "INSERT INTO files ("
			+ "	owner_id,"
			+ "	path,"
			+ "	size,"
			+ "	original_name,"
			+ "	status,"
			+ "	uuid"
			+ ") VALUES "
			+ "<foreach collection='files' item='f' separator=','>"
			+ "("
			+ "	#{o},"
			+ "	#{f.path},"
			+ "	#{f.size},"
			+ "	#{f.name},"
			+ "	#{f.status},"
			+ "	#{f.uuid}"
			+ ")"
			+ "</foreach> "
			+ "</script>")
	boolean saveFiles(@Param("files")List<File> files, @Param("o") int ownerId);
	
}

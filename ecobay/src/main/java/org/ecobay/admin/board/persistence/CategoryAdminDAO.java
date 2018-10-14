package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.CategoryVO;

public interface CategoryAdminDAO {
		
	public CategoryVO categoryLoad(String category_cd) throws Exception;
	
	public List<CategoryVO> categoryList() throws Exception;

}

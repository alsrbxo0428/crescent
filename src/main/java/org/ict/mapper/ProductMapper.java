package org.ict.mapper;

import java.util.List;

import org.ict.domain.ProductVO;

public interface ProductMapper {
	public void insert(ProductVO vo);
	
	public List<ProductVO> selectAll(String pname);
	
	public void update(ProductVO vo);
	
	public ProductVO select(int pno);
	
	public List<ProductVO> selectRecom();
	
	public List<ProductVO> getList();
	
	public void updateSales(int pno);
	
	public void change(int pno);
	
//	public void delete(int pno);
}

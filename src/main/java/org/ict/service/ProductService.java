package org.ict.service;

import java.util.List;

import org.ict.domain.ProductVO;

public interface ProductService {
	public void create(ProductVO vo);
	
	public List<ProductVO> list(String pname);
	
	public void modify(ProductVO vo);
	
	public ProductVO detail(int pno);
	
	public List<ProductVO> recom();
	
	public List<ProductVO> getAll();
	
	public void updateSales(int pno);
	
	public void change(int pno);
	
//	public void remove(int pno);
}

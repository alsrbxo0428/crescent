package org.ict.service;

import java.util.List;

import org.ict.domain.ProductVO;
import org.ict.domain.QnaVO;
import org.ict.domain.ReviewVO;
import org.ict.mapper.CartMapper;
import org.ict.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;
	@Autowired
	private CartMapper ctmapper;
	
	@Override
	public void create(ProductVO vo) {
		mapper.insert(vo);
	}

	@Override
	public List<ProductVO> list(String pname) {
		return mapper.selectAll(pname);
	}

	@Override
	public void modify(ProductVO vo) {
		mapper.update(vo);
	}

	@Override
	public ProductVO detail(int pno) {
		return mapper.select(pno);
	}

	public List<ProductVO> recom() {
		return mapper.selectRecom();
	}

	@Override
	public List<ProductVO> getAll() {
			return mapper.getList();
	}

	@Override
	public void updateSales(int pno) {
		mapper.updateSales(pno);
	}

	@Transactional
	@Override
	public void change(int pno) {
		mapper.change(pno);
		ctmapper.deleteAll(pno);
	}
	
//	@Override
//	public void remove(int pno) {
//		mapper.delete(pno);
//	}
	
}//class
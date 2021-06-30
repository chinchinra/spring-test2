package co.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.dao.MemberDAO;
import co.kr.page.Criteria;
import co.kr.vo.BanksVo;
import co.kr.vo.DepartmentsVO;
import co.kr.vo.MemberVO;

@Service
public class MemberServiceim implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public void write(MemberVO vo) {
	
	
		
		System.out.println("id === " + vo.getEmployee_id());
		System.out.println("id === " + vo.getEmail());
		dao.write(vo);
	}

	
	//목록 조회
	@Override
	public List<MemberVO> lookUpList(Criteria cri) {
		return dao.lookupList(cri);
	}


	@Override
	public MemberVO readVo(Long employee_id) {
		// TODO Auto-generated method stub
		return dao.readMember(employee_id);
	}





	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return dao.listCount();
	}


	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
		
	}


	@Override
	public void delete(Long employee_id) {
		// TODO Auto-generated method stub
		dao.delete(employee_id);
		
	}


	@Override
	public List<BanksVo> bankList() {
		// TODO Auto-generated method stub
		return dao.bankList();
	}


	@Override
	public List<DepartmentsVO> departmentsList() {
		// TODO Auto-generated method stub
		return dao.departmentsList();
	}

}

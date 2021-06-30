package co.kr.dao;

import java.util.List;

import co.kr.page.Criteria;
import co.kr.vo.BanksVo;
import co.kr.vo.DepartmentsVO;
import co.kr.vo.MemberVO;

public interface MemberDAO {
	
	//select
	public List<MemberVO> lookupList(Criteria cri);
	
	public int listCount();
	
	//write
	public void write(MemberVO vo); 
	
	//read
	public MemberVO readMember(Long employee_id);
	
	//update
	public void update(MemberVO vo);
	
	//delete
	public void delete(Long employee_id);
	
	//bank list
	public List<BanksVo> bankList();
	
	//departments list
	public List<DepartmentsVO> departmentsList();
	
		

}

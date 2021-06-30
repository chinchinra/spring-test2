package co.kr.service;

import java.util.List;

import co.kr.page.Criteria;
import co.kr.vo.BanksVo;
import co.kr.vo.DepartmentsVO;
import co.kr.vo.MemberVO;

public interface MemberService {

	public void write(MemberVO vo);

	public List<MemberVO> lookUpList(Criteria cri);

	public int listCount();

	public MemberVO readVo(Long employee_id);

	public void update(MemberVO vo);

	public void delete(Long employee_id);

	// bank list
	public List<BanksVo> bankList();

	// departments list
	public List<DepartmentsVO> departmentsList();

}

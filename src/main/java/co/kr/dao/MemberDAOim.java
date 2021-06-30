package co.kr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.page.Criteria;
import co.kr.vo.BanksVo;
import co.kr.vo.DepartmentsVO;
import co.kr.vo.MemberVO;

@Repository
public class MemberDAOim implements MemberDAO{

	@Inject
	SqlSession session;
	
	
	//¿€º∫
	@Override
	public void write(MemberVO vo) {
		
		session.insert("memberMapper.write",vo);
		
	}

	//list
	@Override
	public List<MemberVO> lookupList(Criteria cri) {
		return session.selectList("memberMapper.readList",cri);
	}


	//read
	@Override
	public MemberVO readMember(Long employee_id) {
		return session.selectOne("memberMapper.read",employee_id);
	}

	@Override
	public int listCount() {
		
		return session.selectOne("memberMapper.listCount");
	}

	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		session.update("memberMapper.update",vo);
	}

	@Override
	public void delete(Long employee_id) {
		// TODO Auto-generated method stub
		session.delete("memberMapper.delete",employee_id);
		
	}

	@Override
	public List<BanksVo> bankList() {
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.banks");
	}

	@Override
	public List<DepartmentsVO> departmentsList() {
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.departments");
	}

}

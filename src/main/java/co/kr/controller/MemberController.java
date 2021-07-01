package co.kr.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.page.Criteria;
import co.kr.page.PageMaker;
import co.kr.service.MemberService;
import co.kr.vo.MemberVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@RequestMapping("/")
	public String boardPage(MemberVO vo, Model model, Criteria cri) {

		logger.info("listView");
		model.addAttribute("list", service.lookUpList(cri));

		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("departmentsList", service.departmentsList());

		return "hr-board";
	}

	@RequestMapping("/writePage")
	public String writePage(Model model) {
		logger.info("writePage");

		model.addAttribute("banksList", service.bankList());
		model.addAttribute("departmentsList", service.departmentsList());

		return "/hr-write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public String writeAction(@RequestBody MemberVO vo, Model model) {

		logger.info("write");
		service.write(vo);

//		return "redirect:/";
		return "succees";

	}

	


	@RequestMapping("/readPage")
	public String readPage(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("readPage");

		model.addAttribute("banksList", service.bankList());
		model.addAttribute("departmentsList", service.departmentsList());
		model.addAttribute("member", service.readVo(employee_id));

		return "/hr-read";
	}

	@RequestMapping("/updatePage")
	public String updatePage(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("updatePage");


		model.addAttribute("member", service.readVo(employee_id));

		return "/hr-update";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("readPage");

		service.delete(employee_id);

		return "redirect:/";
	}
	
	
	
	@RequestMapping(value = "/deleteList", method = RequestMethod.POST)
	public String delete_user(@RequestParam("vehicle1") Long[] employee_id, Model model) throws Exception {
		
		logger.info("deleteList");
	    // 삭제할 사용자 ID마다 반복해서 사용자 삭제
	    for (Long user_id : employee_id) {
	        System.out.println("사용자 삭제 = " + user_id);
	        service.delete(user_id);
	    }
	    // 목록 페이지로 이동
	    return "redirect:/";
	}

	 


	

	// @ResponseBody 응답데이터를 보냄 , @RequestBody 요청 데이터를 받아서 객체에 저장함
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateAction(@RequestBody MemberVO vo, Model model, @RequestParam("employee_id") Long employee_id) {

		vo.setEmployee_id(employee_id);
		logger.info("update");
		service.update(vo);

		return "succees";

	}

}

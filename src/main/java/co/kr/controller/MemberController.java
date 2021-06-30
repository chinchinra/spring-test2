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

		return "hr-board";
	}

	@RequestMapping("/writePage")
	public String writePage(Model model) {
		logger.info("writePage");
		
		model.addAttribute("banksList",service.bankList());
		model.addAttribute("departmentsList",service.departmentsList());
		
		return "/hr-write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public String writeAction(@RequestBody MemberVO vo, Model model) {

//		System.out.println("==id==" + vo.getEmployee_id());
//		System.out.println("==name==" + vo.getName());
//		System.out.println("==email==" + vo.getEmail());
//		System.out.println("==bank_id==" + vo.getBank_id());

		logger.info("write");
		service.write(vo);

//		return "redirect:/";
		return "succees";

	}

	@RequestMapping("/readPage")
	public String readPage(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("readPage");

//		System.out.println(service.readVo(employee_id).getAddress());
		
		
		model.addAttribute("banksList",service.bankList());
		model.addAttribute("departmentsList",service.departmentsList());
		model.addAttribute("member", service.readVo(employee_id));

		return "/hr-read";
	}

	@RequestMapping("/updatePage")
	public String updatePage(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("updatePage");

//		System.out.println(service.readVo(employee_id).getAddress());
		model.addAttribute("member", service.readVo(employee_id));

		return "/hr-update";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("employee_id") Long employee_id) {
		logger.info("readPage");

		service.delete(employee_id);

		return "redirect:/";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateAction(@RequestBody MemberVO vo, Model model , @RequestParam("employee_id") Long employee_id) {

		vo.setEmployee_id(employee_id);
		logger.info("update");
		service.update(vo);

		return "succees";

	}

}

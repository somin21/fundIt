package com.kh.fundit.project.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.Community;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectDelivery;
import com.kh.fundit.project.model.vo.ProjectGift;
/*import com.kh.fundit.project.model.vo.Profile;*/
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectSupport;
import com.kh.fundit.project.model.vo.ProjectView;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
//	소민
	@RequestMapping("selectIndexProject")
	@ResponseBody
	public List<ProjectOutline> selectIndexProject(HttpServletResponse response) {
		
		List<ProjectOutline> list = projectService.selectIndexProject();
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexPopularProject")
	@ResponseBody
	public List<ListProjectView> selectIndexPopularProject(@RequestParam(value="page", required=false, defaultValue="1") int popularProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexPopularProject(popularProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexNewProject")
	@ResponseBody
	public List<ListProjectView> selectIndexNewProject(@RequestParam(value="page", required=false, defaultValue="1") int newProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexNewProject(newProjectPage, numPerpage);
	
		return list;
	}
	
//	소민
	@RequestMapping("selectIndexDeadlineProject")
	@ResponseBody
	public List<ListProjectView> selectIndexDeadlineProject(@RequestParam(value="page", required=false, defaultValue="1") int deadlineProjectPage, HttpServletResponse response) {
		
		int numPerpage = 4;
		List<ListProjectView> list = projectService.selectIndexDeadlineProject(deadlineProjectPage, numPerpage);
	
		return list;
	}
	
//태윤
	@RequestMapping("/project/myProject.do")
	public ModelAndView selectMyProject(@RequestParam String email){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/myProject");
		return mav;
	}
//태윤
	@RequestMapping("/project/selectMyProjectYet")
	@ResponseBody
	public List<ListProjectView> selectMyProjectList(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage,HttpServletResponse response){
		
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
		
		List<ListProjectView> list = projectService.selectMyProjectYet(member, numPerpage);
		
		return list;
	}
	
	//태윤
		@RequestMapping("/project/selectMyProjectYes")
		@ResponseBody
		public List<ListProjectView> selectMyProjectListYes(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
			Member member = new Member();
			System.out.println(email);
			member.setEmail(email);
			
			List<ListProjectView> list = projectService.selectMyProjectYes(member, numPerpage);
			
			return list;
		}
		
//태윤
	@RequestMapping("/project/selectMyProjectNo")
	@ResponseBody
	public List<ListProjectView> selectMyProjectListNo(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
					
		List<ListProjectView> list = projectService.selectMyProjectNo(member, numPerpage);
			
		return list;
	}
	
	
	
	
	
// 태윤
	@RequestMapping("/project/selectMyProjectCnt")
	@ResponseBody
	public int selectMyProjectCnt(@RequestParam String email) {
		Member member = new Member();
		member.setEmail(email);
		int cnt = projectService.selectMyProjectCnt(member);
		
		return cnt;
		
	}
	
	
//	희영
	@RequestMapping("/project/projectList.do")
	public ModelAndView projectList(@RequestParam String categoryCode) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("categoryCode",categoryCode);
		
		List<ListProjectView> list = projectService.projectList(map);
		
		mav.addObject("list",list);
		mav.addObject("categoryCode",categoryCode);
		mav.setViewName("project/projectList");
		
		return mav;
	
	}
//	희영
	@RequestMapping("/project/projectView.do")
	public ModelAndView projectView(@RequestParam int projectNo, String email) {
		ModelAndView mav = new ModelAndView();
		/*System.out.println(projectNo);*/
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",projectNo);
		map.put("buyer_id",email);
		
		//후원현황중인지 확인
		ProjectSupport sList = projectService.supportList(map);
		boolean supportStatus = false;
		if(sList!=null) {
			supportStatus = true;
		}
		
		//커뮤니티 리스트 뽑기
		List<Community> cList = projectService.communityList(map);
		
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.projectView(map);
		
		//선물리스트 받아오기
		List<ProjectGift> List = projectService.projectGiftList(map);
		
		//선물리스트 레벨가져오기
		List<String> gList = projectService.projectGiftLevel(map);
		/*System.out.println("gList="+gList.toString());*/
		//레벨별 orderby 값찾기
		List<Map<String,String>> gList2 = projectService.projectGiftName(map);
		/*System.out.println("gList2="+gList2.toString());*/
		
		String[] strarr = new String[gList.size()];
		String[] strarr2 = new String[gList.size()];
		/*System.out.println("strarr="+strarr.toString());
		System.out.println("strarr크기="+strarr.length);*/
		
		for(int i=0; i<gList.size(); i++) {
			for(int j=0; j<gList2.size(); j++) {
				if(String.valueOf(gList2.get(j).get("MINMONEY")).equals(gList.get(i))) {
					if(strarr[i]==null) {
						strarr[i]=String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]=String.valueOf(gList2.get(j).get("ITEMNUMBER"));
					}else {
						strarr[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNUMBER"));
					}
				}
			}
			System.out.println("itemName="+strarr[i]);
		}
		
		/*System.out.println(list);*/
		String userEmail = "";
		Date calculateduedDate = null;
		int deadlineDay = 0;
		for(ProjectView v : list) {
			userEmail = v.getEmail();
			calculateduedDate = v.getCalculateduedDate();
			deadlineDay = v.getDeadlineDay();
		}

		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(userEmail);
		/*System.out.println(p);*/
		
		mav.addObject("gList",gList);		//최소아이템금액
		mav.addObject("strarr",strarr);		//아이템이름
		mav.addObject("strarr2",strarr2);	//아이템갯수
		mav.addObject("supportStatus",supportStatus);	//후원중인지 확인여부
		mav.addObject("cList",cList);		//커뮤니티리스트
		mav.addObject("list",list);
		mav.addObject("List",List);
		mav.addObject("p",p);
		mav.addObject("projectNo",projectNo);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.addObject("deadlineDay",deadlineDay);
		mav.setViewName("project/projectView");
		
		return mav;
	
	}
//	희영
	@RequestMapping("project/originatorView.do")
	public ModelAndView origitorView(@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		/*System.out.println(email);*/
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("email",email);
		
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.oriProjectList(map);
		
		/*System.out.println("list="+list);*/
		
		//카테고리 구별
		int rowNum = 0;
		String categoryCode = "";
		String category = "";
		
		for(ProjectView v : list) {
			rowNum = v.getRowNum();
			categoryCode += v.getCategoryCode()+",";
		}
		
		/*System.out.println(categoryCode);*/
		if(categoryCode.contains("C1") && !(category.contains("게임")) ) {
			category += "게임,";
		}
		if(categoryCode.contains("C2") && !(category.contains("푸드"))) {
			category += "푸드,";
		}
		if(categoryCode.contains("C3") && !(category.contains("예술"))) {
			category += "예술,";
		}
		if(categoryCode.contains("C4") && !(category.contains("패션"))) {
			category += "패션,";
		}
		if(categoryCode.contains("C5") && !(category.contains("출판"))) {
			category += "출판,";
		}
		if(categoryCode.contains("C6") && !(category.contains("테크놀리지"))) {
			category += "테크놀리지,";
		}
		
		if (category.length() > 0 && category.charAt(category.length()-1)==',') {
			category = category.substring(0, category.length()-1);
		    }
		/*System.out.println(category);*/
		
		//창작자프로필
		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(email);

		mav.addObject("list",list);
		mav.addObject("p",p);
		mav.addObject("rowNum",rowNum);
		mav.addObject("category",category);
		mav.setViewName("project/originatorView");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/interestInsert.do")
	public ModelAndView interestInsert(@RequestParam String no,@RequestParam String email) {
		ModelAndView mav = new ModelAndView();
		System.out.println("email@controll"+email);
		
		Map<String,Object> map = new HashMap<>();
		map.put("no",no);
		map.put("email",email);
		
		//관심프로젝트 체크
		int cnt = projectService.interestCnt(map);
		
		String loc = "/";
		String msg = "";
		
		if(cnt==0) {
			//관심프로젝트 등록하기
			int result = projectService.interestInsert(map);
			
			
			if(result>0) {
				msg = "관심등록 성공! 마이페이지에서 확인하세요.";
				loc = "/project/projectView.do?projectNo="+no;
			}else {
				msg = "관심등록 실패";
			}
		}else if(cnt>0) {
			msg = "이미 관심등록이 되어있습니다. 마이페이지에서 확인하세요.";
			loc = "/project/projectView.do?projectNo="+no;
		}
		
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	
	}
//	희영
	@RequestMapping("/project/supportGo.do")
	public ModelAndView supportGo(@RequestParam String no, String email) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",no);
		map.put("buyer_id",email);

		//후원현황중인지 확인
		ProjectSupport sList = projectService.supportList(map);
		System.out.println("sList="+sList);
		String loc = "/";
		String msg = "";

		if(sList!=null) {
			msg = "같은 프로젝트 후원은 한번만 가능합니다!";
			loc = "/project/projectView.do?projectNo="+no;
			
			mav.addObject("msg",msg);
			mav.addObject("loc",loc);
			mav.setViewName("common/msg");
			return mav;
		}
		
		//선물리스트 받아오기
		List<ProjectGift> List = projectService.projectGiftList(map);
		//프로젝트리스트뽑기
		List<ProjectView> list = projectService.projectView(map);
		String title = "";
		Date calculateduedDate = null;
		for(ProjectView v : list) {
			title = v.getProjectTitle();
			calculateduedDate = v.getCalculateduedDate();
		}
		
		//선물리스트 레벨가져오기
		List<String> gList = projectService.projectGiftLevel(map);
		/*System.out.println("gList="+gList.toString());*/
		//레벨별 orderby 값찾기
		List<Map<String,String>> gList2 = projectService.projectGiftName(map);
		/*System.out.println("gList2="+gList2.toString());*/
		
		String[] strarr = new String[gList.size()];
		String[] strarr2 = new String[gList.size()];
		/*System.out.println("strarr="+strarr.toString());
		System.out.println("strarr크기="+strarr.length);*/
		
		for(int i=0; i<gList.size(); i++) {
			for(int j=0; j<gList2.size(); j++) {
				if(String.valueOf(gList2.get(j).get("MINMONEY")).equals(gList.get(i))) {
					if(strarr[i]==null) {
						strarr[i]=String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]=String.valueOf(gList2.get(j).get("ITEMNUMBER"));
					}else {
						strarr[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNUMBER"));
					}
				}
			}
			/*System.out.println("itemName="+strarr[i]);*/
		}
		
		mav.addObject("gList",gList);
		mav.addObject("strarr",strarr);
		mav.addObject("strarr2",strarr2);
		mav.addObject("projectNo",no);
		mav.addObject("title",title);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.setViewName("project/giftList");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/approval.do")
	public ModelAndView approval(@RequestParam int projectNo, int minMoney, int num, String title ) {
		ModelAndView mav = new ModelAndView();
		
		/*System.out.println("projectNo="+projectNo+"minMoney="+minMoney+"num="+num);*/

		mav.addObject("projectNo",projectNo);
		mav.addObject("minMoney",minMoney);
		mav.addObject("num",num);
		mav.addObject("title",title);
		mav.setViewName("project/approval");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/approval2.do")
	public ModelAndView approval2(@RequestParam int projectNo, int num, String title ) {
		ModelAndView mav = new ModelAndView();
		
		/*System.out.println("projectNo="+projectNo+"minMoney="+minMoney+"num="+num);*/

		mav.addObject("projectNo",projectNo);
		mav.addObject("num",num);
		mav.addObject("title",title);
		mav.setViewName("project/approval");
		
		return mav;
	}
//	희영
	@RequestMapping(value="/project/payments.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	public ModelAndView approval(@RequestParam String imp_uid, String merchant_uid, String apply_num, int amount, 
			String buyer_id, int projectNo, String itemName, String postcode, String address, int minMoney) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("코드="+imp_uid+" merchant_uid="+merchant_uid+" 카드번호="+apply_num+" 결제금액="+amount+" 유저아이디="+buyer_id
				+"프로젝트번호="+projectNo+"아이템="+itemName+"주소="+address+"최소금액="+minMoney);
		//System.out.println("projectNo="+projectNo+"itemName="+itemName+"itemnumber="+itemnumber+"num="+num);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("imp_uid", imp_uid);
		map.put("merchant_uid", merchant_uid);
		map.put("apply_num", apply_num);
		map.put("amount", amount);		//총금액
		map.put("buyer_id", buyer_id);
		map.put("projectNo", projectNo);
		map.put("itemName", itemName);
		map.put("postcode", postcode);
		map.put("address", address);
		map.put("minMoney", minMoney);	//최소금액
		
		//기프트 가격 및 추가 가격 구분하기
		int addMoney = 0;
		
		addMoney = Math.abs(amount - minMoney);
		
		map.put("addMoney", addMoney);

		
		//서포트테이블 추가
		int result = projectService.supportInsert(map);
		//서포트테이블 리스트 및 넘버
		ProjectSupport ps = projectService.supportList(map);
		System.out.println("서포터리스트="+ps);
		int supportNo = ps.getSupportNo();
		map.put("supportNo", supportNo);
		
		//프로젝트리스트뽑기
		List<ProjectView> pList = projectService.projectView(map);
		//결재날짜=배송시작날짜 뽑기
		Date calculateduedDate = null;
		for(ProjectView v : pList) {
			calculateduedDate = v.getCalculateduedDate();
		}
		map.put("calculateduedDate", calculateduedDate);
		
		//배송정보 테이블 추가
		int result2 = projectService.deliveryInsert(map);
		
		//결재정보테이블 추가
		int result3 = projectService.insertPayment(map);
		
		boolean isUsable = false;
		
		if(result3>0) {
			isUsable = true;
		}
		System.out.println("result="+result+"result2="+result2+"result3="+result3+"isUsable="+isUsable);
		
		Map<String,Object> map2 = new HashMap<>();
		map2.put("isUsable", isUsable);
		
		mav.addAllObjects(map2);
		mav.setViewName("jsonView");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/community.do")
	public ModelAndView community(@RequestParam int projectNo, String contextId, String communityContext) {
		ModelAndView mav = new ModelAndView();
	
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("contextId", contextId);
		map.put("communityContext", communityContext);
		
		int result = projectService.communityInsert(map);
		
		String loc = "/";
		String msg = "";
		
		if(result>0) {
			msg = "게시글등록 성공!";
			loc = "/project/projectView.do?projectNo="+projectNo;
		}else {
			msg = "게시글등록 실패!\n관리자에게 문의하세요.";
		}

		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	}

//	소민
	@RequestMapping("/project/makeProject/outline")
	public String makeProjectOutline() {
		return "project/projectMake_outline";
	}
	
//	소민
	@RequestMapping("/project/makeProject/funding-gift")
	public String makeProjectFundingGift() {
		return "project/projectMake_funding_gift";
	}
	
//	소민
	@RequestMapping("/project/makeProject/story")
	public String makeProjectStory() {
		return "project/projectMake_story";
	}
	
//	소민
	@RequestMapping("/project/makeProject/account")
	public String makeProjectAccount() {
		return "project/projectMake_account";
	}

}

package com.kh.fundit.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;
import com.kh.fundit.project.model.service.ProjectService;
import com.kh.fundit.project.model.vo.Community;
import com.kh.fundit.project.model.vo.Item;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.ProjectAccount;
import com.kh.fundit.project.model.vo.ProjectFunding;
import com.kh.fundit.project.model.vo.ProjectGift;
/*import com.kh.fundit.project.model.vo.Profile;*/
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectStory;
import com.kh.fundit.project.model.vo.ProjectSupport;
import com.kh.fundit.project.model.vo.ProjectView;
import com.kh.fundit.project.model.vo.SupportPayment;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;

@Controller
public class ProjectController {
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	
//	태윤
	@RequestMapping("/project/myProject.do")
	public ModelAndView selectMyProject(@RequestParam String email){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/myProject");
		return mav;
	}
	
//	태윤
	@RequestMapping("/project/selectMyProjectYet")
	@ResponseBody
	public List<ListProjectView> selectMyProjectList(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage,HttpServletResponse response){
		
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
		
		List<ListProjectView> list = projectService.selectMyProjectYet(member, numPerpage);
		
		return list;
	}
	
//	태윤
	@RequestMapping("/project/selectMyProjectYes")
	@ResponseBody
	public List<ListProjectView> selectMyProjectListYes(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
		
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
		
		List<ListProjectView> list = projectService.selectMyProjectYes(member, numPerpage);
		
		return list;
	}
		
//	태윤
	@RequestMapping("/project/selectMyProjectNo")
	@ResponseBody
	public List<ListProjectView> selectMyProjectListNo(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
					
		List<ListProjectView> list = projectService.selectMyProjectNo(member, numPerpage);
			
		return list;
	}
	
//	태윤
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
	public ModelAndView projectList(@RequestParam String categoryCode, String select, String deadline ) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("categoryCode",categoryCode);
		map.put("select",select);
		map.put("deadline",deadline);
		
		System.out.println("select="+select);
		System.out.println("deadline="+deadline);
		List<ListProjectView> list = projectService.projectList(map);
		System.out.println("list="+list);
		
		mav.addObject("list",list);
		mav.addObject("categoryCode",categoryCode);
		mav.addObject("select",select);
		mav.addObject("deadline",deadline);
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
		
		//프로젝트 스토리 뽑기
		ProjectStory ps = projectService.projectStoryList(map);

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
		String refund="";
		for(ProjectView v : list) {
			userEmail = v.getEmail();
			calculateduedDate = v.getCalculateduedDate();
			deadlineDay = v.getDeadlineDay();
			refund = v.getRefund();
		}

		com.kh.fundit.project.model.vo.Profile p = projectService.profileUser(userEmail);
		/*System.out.println(p);*/
		
		//System.out.println("supportStatus="+supportStatus);
		
		mav.addObject("gList",gList);		//최소아이템금액
		mav.addObject("strarr",strarr);		//아이템이름
		mav.addObject("strarr2",strarr2);	//아이템갯수
		mav.addObject("supportStatus",supportStatus);	//후원중인지 확인여부
		mav.addObject("cList",cList);		//커뮤니티리스트
		mav.addObject("list",list);
		mav.addObject("List",List);
		mav.addObject("ps",ps);				//프로젝트스토리
		mav.addObject("email",email);
		mav.addObject("p",p);
		mav.addObject("projectNo",projectNo);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.addObject("refund",refund);
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
				loc = "/project/projectView.do?projectNo="+no+"&email="+email;
			}else {
				msg = "관심등록 실패";
			}
		}else if(cnt>0) {
			msg = "이미 관심등록이 되어있습니다. 마이페이지에서 확인하세요.";
			loc = "/project/projectView.do?projectNo="+no+"&email="+email;
		}
		
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	
	}
	
//	희영
	@RequestMapping("/project/supportGo.do")
	public ModelAndView supportGo(@RequestParam String no, String email, int minmoney) {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",no);
		map.put("buyer_id",email);

		//후원현황중인지 확인
		ProjectSupport sList = projectService.supportList(map);
		String loc = "/";
		String msg = "";

		if(sList!=null) {
			msg = "같은 프로젝트 후원은 한번만 가능합니다!";
			loc = "/project/projectView.do?projectNo="+no+"&email="+email;
			
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
		//레벨별 orderby 값찾기
		List<Map<String,String>> gList2 = projectService.projectGiftName(map);
		
		String[] strarr = new String[gList.size()];
		String[] strarr2 = new String[gList.size()];
		String[] strarr3 = new String[gList.size()];
	
		
		for(int i=0; i<gList.size(); i++) {
			for(int j=0; j<gList2.size(); j++) {
				if(String.valueOf(gList2.get(j).get("MINMONEY")).equals(gList.get(i))) {
					if(strarr[i]==null) {
						strarr[i]=String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]=String.valueOf(gList2.get(j).get("ITEMNUMBER"));
						strarr3[i]=String.valueOf(gList2.get(j).get("DELIVERYYN"));
					}else {
						strarr[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNAME"));
						strarr2[i]+=", "+String.valueOf(gList2.get(j).get("ITEMNUMBER"));
						strarr3[i]+=", "+String.valueOf(gList2.get(j).get("DELIVERYYN"));
					}
				}
			}
		}
		
		mav.addObject("gList",gList);
		mav.addObject("strarr",strarr);		//아이템명
		mav.addObject("strarr2",strarr2);	//아이템갯수
		mav.addObject("strarr3",strarr3);	//배송여부
		mav.addObject("projectNo",no);
		mav.addObject("minmoney",minmoney);
		mav.addObject("title",title);
		mav.addObject("calculateduedDate",calculateduedDate);
		mav.setViewName("project/giftList");
		
		return mav;
	}
	
//	희영
	@RequestMapping("/project/approval.do")
	public ModelAndView approval(@RequestParam int projectNo, int minMoney, int num, String title, String itemName, String itemNum, String delivery ) {
		ModelAndView mav = new ModelAndView();
		
		/*System.out.println("projectNo="+projectNo+"minMoney="+minMoney+"num="+num);*/

		mav.addObject("projectNo",projectNo);
		mav.addObject("itemName",itemName);
		mav.addObject("itemNum",itemNum);
		mav.addObject("minMoney",minMoney);
		mav.addObject("num",num);
		mav.addObject("title",title);
		mav.addObject("delivery",delivery);
		mav.setViewName("project/approval");
		
		return mav;
	}
	
//	희영
	@RequestMapping(value="/project/approval2.do", method = RequestMethod.POST)
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
			String buyer_id, int projectNo, String title, String postcode, String address, int minMoney, String itemName, String itemNum, String delivery) {
		ModelAndView mav = new ModelAndView();
		
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
		map.put("itemNum", itemNum);	//아이템갯수
		map.put("delivery", delivery);	//배송여부
		
		//기프트 가격 및 추가 가격 구분하기
		int addMoney = 0;
		
		addMoney = Math.abs(amount - minMoney);
		
		map.put("addMoney", addMoney);

		
		//서포트테이블 추가
		int result = projectService.supportInsert(map);
		//서포트테이블 리스트 및 넘버
		ProjectSupport ps = projectService.supportList(map);
		//System.out.println("서포터리스트="+ps);
		int supportNo = ps.getSupportNo();
		map.put("supportNo", supportNo);
		
		//프로젝트리스트뽑기
		List<ProjectView> pList = projectService.projectView(map);
		
		//결재날짜=배송시작날짜 뽑기
		Date calculateduedDate = null;
		int supportGoal = 0;	//목표금액
		int supportMoney = 0;	//현재금액
		int supportor = 0 ; 	//서포터수
		
		for(ProjectView v : pList) {
			calculateduedDate = v.getCalculateduedDate();
			
			supportGoal=v.getSupportGoal();
			supportMoney=v.getSupportMoney()+amount;	//총후원금액
			supportor=v.getSupportor()+1; 				//서포터 한명추가
		}
		
		double supportpercent = (((double)supportGoal*(double)100)/(double)supportMoney);	//현재 목표 퍼센트상황
		int supportwithouttax = (int)(supportMoney*0.9); //세금후금액
		
		map.put("supportMoney",supportMoney);
		map.put("supportor",supportor);
		map.put("supportpercent",supportpercent);
		map.put("supportwithouttax",supportwithouttax);
		
		map.put("calculateduedDate", calculateduedDate);
		
		//배송정보 테이블 추가
		int result2 = projectService.deliveryInsert(map);
		
		//결재정보테이블 추가
		int result3 = projectService.insertPayment(map);
		
		int result4 = projectService.projectSummary(map);
		
		//System.out.println("현재서포트머니="+supportMoney+"현재서포터수="+supportor+"현재퍼센트="+supportpercent+"세금후금액="+supportwithouttax);
		//System.out.println("result4="+result4);
		
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
			loc = "/project/projectView.do?projectNo="+projectNo+"&email="+contextId;
		}else {
			msg = "게시글등록 실패!\\n관리자에게 문의하세요.";
		}

		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/communityUpdate.do")
	public ModelAndView communityUpdate(@RequestParam String contextId, String communityContext, int projectNo, int communityNo) {
		ModelAndView mav = new ModelAndView();
	
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("communityNo", communityNo);
		map.put("contextId", contextId);
		map.put("communityContext", communityContext);
		
		int result = projectService.communityUpdate(map);
		
		String loc = "/";
		String msg = "";
		
		if(result>0) {
			msg = "게시글수정 성공!";
			loc = "/project/projectView.do?projectNo="+projectNo+"&email="+contextId;
		}else {
			msg = "게시글수정 실패!\\n관리자에게 문의하세요.";
		}

		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
	}
//	희영
	@RequestMapping("/project/paymentCancel.do")
	public ModelAndView paymentCancel(@RequestParam int projectNo, String email) {
		ModelAndView mav = new ModelAndView();
	
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("email", email);
		
		//결제정보리스트
		List<SupportPayment> list = projectService.paymentCancel(map);
		
		String msg="결제 정보를 찾을수가 없습니다.\\n관리자에게 문의해주세요ㅠㅠ";
		String loc="/";
		
		String payNo="";
		String payMoney="";
		
		for(SupportPayment sp : list) {
			payNo = sp.getPayNo();
			payMoney=sp.getPayMoney();	//결제금액
		}
		
		if(payNo!=null) {
			//임포트에서 결제취소작업
			IamportClient ic = new IamportClient("4713522635694358", "I993CW83GgrgwFXRgDOKXoy66EZ6uSad1khEgqIXG9ecPb36OSQMgoTn3SuyLEMNY3sftbcakqnaBrgq");
			   
			CancelData cd = new CancelData(payNo, true);
	
			cd.setReason("후원취소");
			int success = ic.cancelPaymentByImpUid(cd).getCode();
			System.out.println(success);
			System.out.println(ic.cancelPaymentByImpUid(cd).getCode());
			System.out.println(success);
			System.out.println(ic.cancelPaymentByImpUid(cd).getMessage());
			System.out.println(ic.cancelPaymentByImpUid(cd).getResponse());
			
			if(success==0) {
				//결제DB수정작업
				int result = projectService.paymentCancelDel(map);
				
				//System.out.println("result="+result);
				
				if(result>0) {
					//프로젝트리스트뽑기
					List<ProjectView> pList = projectService.projectView(map);
					//System.out.println("프로젝트리스트="+pList);
					
					int supportGoal = 0;	//목표금액
					int supportMoney = 0;	//현재금액
					int supportor = 0 ; 	//서포터수
					
					for(ProjectView v : pList) {						
						supportGoal=v.getSupportGoal();
						//총후원금액에서 결제금액빼기
						supportMoney=v.getSupportMoney()-Integer.parseInt(payMoney);
						//서포터 한명감소						
						supportor=v.getSupportor()-1; 				
					}
					
					double supportpercent = (int) (((double)supportGoal*(double)100)/(double)supportMoney);	//현재 목표 퍼센트상황
					int supportwithouttax = (int)(supportMoney*0.9); //세금후금액
					
					map.put("supportMoney",supportMoney);
					map.put("supportor",supportor);
					map.put("supportpercent",supportpercent);
					map.put("supportwithouttax",supportwithouttax);
					int result2 = projectService.projectSummary(map);
					//System.out.println("테이블수정resutl2="+result2);
					msg = "결제 취소가 완료되었습니다.다음에 더 좋은 프로젝트로 찾아뵙겠습니다.";
					loc = "/project/projectView.do?projectNo="+projectNo+"&email="+email;
				}else {
					msg = "시스템오류...관리자에게 문의해주세요!!!";
					loc = "/project/projectView.do?projectNo="+projectNo+"&email="+email;
				}
			}else {
				msg = "이미 결제 취소가 완료된 프로젝트입니다.";
				loc = "/project/projectView.do?projectNo="+projectNo+"&email="+email;
			}
		}

		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		
		return mav;
}

//	소민
	@RequestMapping("/project/makeProject/outline")
	public ModelAndView makeProjectOutline(@RequestParam(value="email") String email) {
		
		ModelAndView mav = new ModelAndView();
		
		Profile profile = projectService.makeProject(email);
		
		mav.addObject("profile", profile);
		mav.setViewName("project/projectMake_outline");
		
		return mav;
	}
	
//	소민
	@RequestMapping(value="/project/makeProject/funding-gift", method=RequestMethod.POST)
	public ModelAndView makeProjectFundingGift(ProjectOutline outline, Profile profile,
											   @RequestParam(value="profileName") String name,
											   @RequestParam(value="projectImageFile") MultipartFile projectImage, 
											   @RequestParam(value="profileImageFile", required=false) MultipartFile profileImage,
											   HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(outline);
		System.out.println(profile);
		
		// 프로젝트 이미지 업로드
		String firstDir = request.getSession().getServletContext().getRealPath("/resources/images/projects");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String secondDir = sdf.format(new Date(System.currentTimeMillis()));
		File saveDir = new File(firstDir+"/"+secondDir);
		if(!saveDir.exists()) {
			saveDir.mkdirs();
		}		
		String originalName = projectImage.getOriginalFilename();
		String p_ext = originalName.substring(originalName.lastIndexOf(".")+1);
		String email_id = outline.getEmail().substring(0, outline.getEmail().indexOf("@"));
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		int rndNum = (int)(Math.random()*1000);
		String renamedName = email_id+"_"+sdf2.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+p_ext;
		try {
			projectImage.transferTo(new File(firstDir+"/"+secondDir+"/"+renamedName));
		} catch (IllegalStateException | IOException e1) {
			e1.printStackTrace();
		}
		outline.setProjectImage(secondDir+"/"+renamedName);
		// 프로젝트 이미지 업로드 끝

        // 프로필 이미지 업로드
		if(profileImage != null) {
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/profileImg");
			String realName = profileImage.getOriginalFilename();
			String ext = realName.substring(realName.lastIndexOf(".")+1);
			String id = profile.getEmail().replaceAll("\\.","_");
			String id2 = id.replaceAll("@", "_");
			String renamedFileName = id2 + "."+ext;
			if(!ext.equals("")) {
				File profileImgFile = new File(saveDirectory+"/"+renamedFileName);
				if(profileImgFile.exists() == true) {
					profileImgFile.delete();
				}
		        try {
					profileImage.transferTo(profileImgFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	        	profile.setProfileImage(renamedFileName);
	        }
		}
		// 프로필 이미지 업로드 끝
        
        Map<String,String> map = new HashMap<>();
        map.put("email", profile.getEmail());
        map.put("name", name);
		int projectNo = projectService.makeProjectOutline(outline, profile, map);
		
		mav.addObject("projectNo", projectNo);
		mav.setViewName("project/projectMake_funding_gift");
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/updateProject/outline")
	public ModelAndView updateProject(@RequestParam(value="projectNo") int projectNo) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("projectNo@updateProject/outline = "+projectNo);
		ProjectOutline outline = projectService.selectProjectOutline(projectNo);
		Profile profile = projectService.makeProject(outline.getEmail());
		
		mav.addObject("outline", outline);
		mav.addObject("profile", profile);
		mav.addObject("projectNo", outline.getProjectNo());		
		mav.setViewName("project/projectUpdate_outline");
		
		return mav;
	}
	
//	소민
	@RequestMapping(value="/project/updateProject/funding-gift", method=RequestMethod.POST)
	public ModelAndView updateProjectOutline(ProjectOutline outline, Profile profile,
											 @RequestParam(value="profileName") String name,
											 @RequestParam(value="projectImageFile", required=false) MultipartFile projectImage, 
											 @RequestParam(value="profileImageFile", required=false) MultipartFile profileImage,
											 HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(outline);
		System.out.println(profile);
		System.out.println(projectImage);
		System.out.println(profileImage);
		
		// 프로젝트 이미지 업로드
		if(projectImage != null) {
			String firstDir = request.getSession().getServletContext().getRealPath("/resources/images/projects");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String secondDir = sdf.format(new Date(System.currentTimeMillis()));
			File saveDir = new File(firstDir+"/"+secondDir);
			if(!saveDir.exists()) {
				saveDir.mkdirs();
			}		
			String originalName = projectImage.getOriginalFilename();
			String p_ext = originalName.substring(originalName.lastIndexOf(".")+1);
			String email_id = outline.getEmail().substring(0, outline.getEmail().indexOf("@"));
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
			int rndNum = (int)(Math.random()*1000);
			String renamedName = email_id+"_"+sdf2.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+p_ext;
			if(!p_ext.equals("")) {
				try {
					projectImage.transferTo(new File(firstDir+"/"+secondDir+"/"+renamedName));
				} catch (IllegalStateException | IOException e1) {
					e1.printStackTrace();
				}
				outline.setProjectImage(secondDir+"/"+renamedName);
			}
		}
		// 프로젝트 이미지 업로드 끝

        // 프로필 이미지 업로드
		if(profileImage != null) {
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/profileImg");
			String realName = profileImage.getOriginalFilename();
			String ext = realName.substring(realName.lastIndexOf(".")+1);
			String id = profile.getEmail().replaceAll("\\.","_");
			String id2 = id.replaceAll("@", "_");
			String renamedFileName = id2 + "."+ext;
			if(!ext.equals("")) {
				File profileImgFile = new File(saveDirectory+"/"+renamedFileName);
				if(profileImgFile.exists() == true) {
					profileImgFile.delete();
				}
		        try {
					profileImage.transferTo(profileImgFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}	        
	        	profile.setProfileImage(renamedFileName);
	        }
		}
		// 프로필 이미지 업로드 끝
        
        Map<String,String> map = new HashMap<>();
        map.put("email", profile.getEmail());
        map.put("name", name);
		int result = projectService.updateProjectOutline(outline, profile, map);
		
		if(result>0) {
			
			ProjectFunding funding = projectService.selectProjectFunding(outline.getProjectNo());
			List<Integer> mList = projectService.projectGiftMoneyList(outline.getProjectNo());
			Map<String,Object> gMap = new HashMap<>();
			gMap.put("projectNo",outline.getProjectNo());
			List<ProjectGift> gList = projectService.projectGiftList(gMap);
			List<Item> iList = projectService.selectItemList(outline.getProjectNo());
			
			mav.addObject("funding", funding);
			mav.addObject("mList", mList);
			mav.addObject("gList", gList);
			mav.addObject("iList", iList);
			
			Map<Integer,String> explainMap = new HashMap<>();
			Map<Integer,String> deliveryMap = new HashMap<>();
			
			for(int money : mList) {
				for(ProjectGift gift : gList) {
					
					if(gift.getMinMoney() == money) {
						explainMap.put(money, gift.getGiftexplain());
						deliveryMap.put(money, gift.getDeliveryYN());
						break;
					}
				}
			}
			
			mav.addObject("explainMap", explainMap);
			mav.addObject("deliveryMap", deliveryMap);
			mav.addObject("projectNo", outline.getProjectNo());
			mav.setViewName("project/projectUpdate_funding_gift");
			
		} else {
			
			mav.addObject("msg", "프로젝트 개요 수정 처리 실패하였습니다\\n다시 시도해주십시오");
			mav.addObject("loc", "${pageContext.request.contextPath}/project/myProject.do?email=${memberLoggedIn.email}");
			mav.setViewName("common/msg");
			
		}
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/makeProject/story")
	public ModelAndView makeProjectStory(ProjectFunding funding) {
		
		ModelAndView mav = new ModelAndView();
		
		int projectNo = projectService.makeProjectFunding(funding);
		
		mav.addObject("projectNo", projectNo);
		mav.setViewName("project/projectMake_story");
		
		return mav;
	}
	
//	소민
	@RequestMapping(value="/project/summerImageUpload", method=RequestMethod.POST)
	@ResponseBody
	public String summerImageUpload(@RequestParam(value="image") MultipartFile image, HttpServletRequest request) {
		
		System.out.println(image);
		
		// 프로젝트 이미지 업로드
		String firstDir = request.getSession().getServletContext().getRealPath("/resources/images/projects");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String secondDir = sdf.format(new Date(System.currentTimeMillis()));
		File saveDir = new File(firstDir+"/"+secondDir);
		if(!saveDir.exists()) {
			saveDir.mkdirs();
		}		
		String originalName = image.getOriginalFilename();
		String p_ext = originalName.substring(originalName.lastIndexOf(".")+1);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		int rndNum = (int)(Math.random()*1000);
		String renamedName = "projectImg_"+sdf2.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+p_ext;
		try {
			image.transferTo(new File(firstDir+"/"+secondDir+"/"+renamedName));
		} catch (IllegalStateException | IOException e1) {
			e1.printStackTrace();
		}
		// 프로젝트 이미지 업로드 끝
		
		System.out.println(secondDir+"/"+renamedName);
		
		return secondDir+"/"+renamedName;
	}
	
	
//	소민
	@RequestMapping("/project/updateProject/story")
	public ModelAndView updateProjectStory(ProjectFunding funding) {
		
		ModelAndView mav = new ModelAndView();
		
		int result = projectService.updateProjectFunding(funding);
		
		if(result > 0) {
			
			ProjectStory story = projectService.selectProjectStory(funding.getProjectNo());
			
			mav.addObject("story", story);
			mav.addObject("projectNo", funding.getProjectNo());
			mav.setViewName("project/projectUpdate_story");
		
		} else {
		
			mav.addObject("msg", "펀딩 및 선물 수정 처리 실패하였습니다\\n다시 시도해주십시오");
			mav.addObject("loc", "${pageContext.request.contextPath}/project/myProject.do?email=${memberLoggedIn.email}");
			mav.setViewName("common/msg");
		}
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/makeProject/insertItem")
	@ResponseBody
	public Item insertItem(@RequestParam(value="isFirst") boolean isFirst, Item item) {
		
		if(isFirst == true) {
			projectService.deleteGift(item.getProjectNo());
			projectService.deleteItem(item.getProjectNo());
		}
		
		return projectService.insertItem(item);
	}
	
//	소민
	@RequestMapping("/project/makeProject/updateItem")
	@ResponseBody
	public void updateItem(Item item) {
		
		projectService.updateItem(item);
	}
	
//	소민
	@RequestMapping("/project/makeProject/selectItemList")
	@ResponseBody
	public List<Item> selectItemList(int projectNo) {
		
		return projectService.selectItemList(projectNo);
	}

//	소민
	@RequestMapping("/project/makeProject/insertGift")
	@ResponseBody
	public ProjectGift insertGift(@RequestParam(value="isFirst") boolean isFirst, ProjectGift gift) {
		
		if(isFirst == true) {
			projectService.deleteGift(gift.getProjectNo());
		}
		 
		return projectService.insertGift(gift);
	}
	
//	소민
	@RequestMapping("/project/makeProject/deleteGift")
	@ResponseBody
	public void deleteGift(@RequestParam(value="projectNo") int projectNo, @RequestParam(value="minMoney") int minMoney) {
		
		Map<String,Integer> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("minMoney", minMoney);
		
		projectService.deleteGift(map);
	}	
	
//	희영
	@RequestMapping(value="/project/emailAuthentication.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	public ModelAndView emailAuthentication(@RequestParam String email,@RequestParam String emailId, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("emailId", emailId);
		
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		
		boolean emailAuthentication = false;	//인증이된 이메일인지 확인
		boolean isUsable = false;				//인증번호발금 확인
		boolean isUsable2 = false;				//인증중인 이메일인지 확인
		
        final String joinCode = String.valueOf(ran);	//인증번호 생성
        map.put("joinCode", joinCode);
        
        //Y인경우찾기
        List<String> list = projectService.emailAuthenticationList(map);//Y리스트
        List<String> list2 = projectService.emailAuthenticationListN(map);//N리스트
        
        if(!(list.isEmpty())) {	//Y인경우가 있는지 확인
        	//System.out.println("인증이된 이메일입니다.");
        	emailAuthentication=true;
        }else if(!(list2.isEmpty())) {//N인 경우가 있는지 확인
			//System.out.println("인증중인 이메일입니다.");
			isUsable2=true;
        }
        else {	//Y,N이없으니깐 인증번호를 보내주고 db에 저장한다.
	        	int result = projectService.emailAuthentication(map);
	        
				final String sendEmail = email;
	
				if(result>0) {//DB에 저장이 성공하면 인증메일을 보냄!
					//System.out.println("메일보내기성공");
					//System.out.println("인증코드="+joinCode);
					isUsable=true;
					//System.out.println("메일인증트루여부="+isUsable);
				    final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				        @Override
				        public void prepare(MimeMessage mimeMessage) throws Exception {
				            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				            helper.setFrom("flyingboy147@naver.com");
				            helper.setTo(sendEmail);
				            helper.setSubject("fundit에서 이메일 인증번호를 보내드립니다.");
				            helper.setText("인증번호는 【"+joinCode+"】");
				            }
				        };
				        mailSender.send(preparator);
				}else {
					System.out.println("DB오류!!!!이메일인증 생성오류!!!!관리자에게문의!!!");
				}
				//System.out.println("result="+result);
        }

        mav.addObject("emailAuthentication", emailAuthentication);
        mav.addObject("isUsable", isUsable);
        mav.addObject("isUsable2", isUsable2);
		mav.setViewName("jsonView");
		
		return mav;
	}
//	희영
	@RequestMapping(value="/project/emailNum.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	public ModelAndView emailNum(@RequestParam String num,String email) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("email", email);
				
		boolean isUsable = false;
		boolean isUsable2 = false;	//인증번호발급받았는지 확인
		
		List<String> list = projectService.emailNumList(map);//인증번호맞는지 확인
		List<String> list2 = projectService.emailAuthenticationListN(map);//N확인으로 인증번호발급했는지 확인

		if(list2.isEmpty()) {
			System.out.println("인증번호를 전송해주세요.");
			isUsable2 =true;
		}else if(!(list.isEmpty())) {
			System.out.println("인증번호가 확인되었습니다.");
			projectService.updateConfirmYN(map);
			isUsable=true;
		}
		
        mav.addObject("isUsable", isUsable);
        mav.addObject("isUsable2", isUsable2);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/makeProject/account")
	public ModelAndView makeProjectAccount(ProjectStory story,
										   @RequestParam(value="projectMovie", required=false) MultipartFile projectMovie,
										   HttpServletRequest request) {
		
		System.out.println(story);
		ModelAndView mav = new ModelAndView();
		
		// 프로젝트 영상 업로드
		if(projectMovie != null) {
			String firstDir = request.getSession().getServletContext().getRealPath("/resources/images/projects");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String secondDir = sdf.format(new Date(System.currentTimeMillis()));
			File saveDir = new File(firstDir+"/"+secondDir);
			if(!saveDir.exists()) {
				saveDir.mkdirs();
			}		
			String originalName = projectMovie.getOriginalFilename();
			String p_ext = originalName.substring(originalName.lastIndexOf(".")+1);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
			int rndNum = (int)(Math.random()*1000);
			String renamedName = story.getProjectNo()+"_"+sdf2.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+p_ext;
			if(!p_ext.equals("")) {
				try {
					projectMovie.transferTo(new File(firstDir+"/"+secondDir+"/"+renamedName));
				} catch (IllegalStateException | IOException e1) {
					e1.printStackTrace();
				}
				story.setIntroduceMovie(secondDir+"/"+renamedName);
			}
		}
		// 프로젝트 영상 업로드 끝
		
		System.out.println(story);
		int projectNo = projectService.makeProjectStory(story);
		
		mav.addObject("projectNo",projectNo);
		mav.setViewName("project/projectMake_account");
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/updateProject/account")
	public ModelAndView updateProjectAccount(ProjectStory story,
										   @RequestParam(value="projectMovie", required=false) MultipartFile projectMovie,
										   HttpServletRequest request) {
		
		System.out.println(story);
		ModelAndView mav = new ModelAndView();
		
		// 프로젝트 영상 업로드
		if(projectMovie != null) {
			String firstDir = request.getSession().getServletContext().getRealPath("/resources/images/projects");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String secondDir = sdf.format(new Date(System.currentTimeMillis()));
			File saveDir = new File(firstDir+"/"+secondDir);
			if(!saveDir.exists()) {
				saveDir.mkdirs();
			}		
			String originalName = projectMovie.getOriginalFilename();
			String p_ext = originalName.substring(originalName.lastIndexOf(".")+1);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
			int rndNum = (int)(Math.random()*1000);
			String renamedName = story.getProjectNo()+"_"+sdf2.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+p_ext;
			System.out.println("///"+p_ext+"///");
			System.out.println("///"+p_ext.length()+"///");
			if(p_ext.length() != 0) {
				try {
					projectMovie.transferTo(new File(firstDir+"/"+secondDir+"/"+renamedName));
				} catch (IllegalStateException | IOException e1) {
					e1.printStackTrace();
				}
				story.setIntroduceMovie(secondDir+"/"+renamedName);
			}
		}
		// 프로젝트 영상 업로드 끝
		
		System.out.println(story);
		int result = projectService.updateProjectStory(story);
		
		if(result > 0) {
			
			ProjectAccount account = projectService.selectProjectAccount(story.getProjectNo());
			
			mav.addObject("account", account);
			mav.addObject("projectNo", story.getProjectNo());
			mav.setViewName("project/projectUpdate_account");
		
		} else {
		
			mav.addObject("msg", "스토리 텔링 처리 실패하였습니다\\n다시 시도해주십시오");
			mav.addObject("loc", "${pageContext.request.contextPath}/project/myProject.do?email=${memberLoggedIn.email}");
			mav.setViewName("common/msg");
		}
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/makeProject/end")
	public ModelAndView makeProjectEnd(ProjectAccount account, @RequestParam(value="confirmEmail") String confirmEmail) {
		
		ModelAndView mav = new ModelAndView();
		
		account.setEmail(confirmEmail);
		int result = projectService.makeProjectAccount(account);
		
		if(result > 0) {
			
			mav.addObject("msg","프로젝트 작성을 완료하였습니다.\\n내용 확인 및 수정 후 검토 요청하기를 눌러주세요");
			mav.addObject("loc", "/project/projectPreview?projectNo="+account.getProjectNo());
			
		} else {
			
			mav.addObject("msg","프로젝트 작성 처리 중 문제가 발생하였습니다.\\n다시 시도해주십시오.");
			mav.addObject("loc", "/");
			mav.setViewName("common/msg");
			
		}
				
		
		return mav;
	}

	
//	소민
	@RequestMapping("/project/updateProject/end")
	public ModelAndView updateProjectEnd(ProjectAccount account, @RequestParam(value="confirmEmail") String confirmEmail) {
		
		ModelAndView mav = new ModelAndView();
		
		account.setEmail(confirmEmail);
		int result = projectService.updateProjectAccount(account);
		
		if(result > 0) {
			
			mav.addObject("msg","프로젝트 수정을 완료하였습니다.\\n내용 확인 및 수정 후 검토 요청하기를 눌러주세요");
			mav.addObject("loc", "/project/projectPreview?projectNo="+account.getProjectNo());
			
		} else {
			
			mav.addObject("msg","프로젝트 작성 처리 중 문제가 발생하였습니다.\\n다시 시도해주십시오.");
			mav.addObject("loc", "/");
			
		}
				
		mav.setViewName("common/msg");
		
		return mav;
	}
	
//	소민
	@RequestMapping("/project/confirm")
	public ModelAndView projectConfirm(@RequestParam(value="projectNo") int projectNo) {
		
		ModelAndView mav = new ModelAndView();
		
		int result = projectService.projectConfirm(projectNo);
		
		String msg = "";
		if(result > 0) {
			msg = "프로젝트 검토 요청되었습니다.";
		} else {
			msg = "프로젝트 검토 요청 실패하였습니다.";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("loc", "/");
		mav.setViewName("common/msg");
		
		return mav;
	}

//  태윤
	@RequestMapping("/project/deleteProject.do")
	@ResponseBody
	public int deleteProject(@RequestParam int projectNo, @RequestParam String memberLoggedIn) {
		
		Map <String, Object> map = new HashMap<>();
		map.put("projectNo",projectNo);
		map.put("memberLoggedIn", memberLoggedIn);
		
		int result = projectService.deleteProject(projectNo, map);
		
		return result;
	}
//태윤
	@RequestMapping("/project/selectMyProjectI")
	@ResponseBody
	public List<ListProjectView> selectMyProjectListI(@RequestParam String email, @RequestParam(value="page", required=false, defaultValue="4") int numPerpage, HttpServletResponse response){
			
		Member member = new Member();
		System.out.println(email);
		member.setEmail(email);
					
		List<ListProjectView> list = projectService.selectMyProjectI(member, numPerpage);
			
		return list;
	}
	
//	소민
	@RequestMapping("/project/projectPreview")
	public ModelAndView projectPreview(@RequestParam("projectNo") int projectNo)	{
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo",projectNo);
		
		//프로젝트리스트뽑기
		ProjectView view = projectService.projectPreview(projectNo);
		
		System.out.println(view);
		
		//선물리스트 받아오기
		List<Integer> mList = projectService.projectGiftMoneyList(projectNo);
		List<ProjectGift> gList = projectService.projectGiftList(map);
		
		//프로필 받아오기
		Profile p = projectService.makeProject(view.getEmail());
		
		mav.addObject("view",view);
		mav.addObject("mList",mList);
		mav.addObject("gList",gList);
		mav.addObject("p",p);
		mav.setViewName("project/projectPreview");
		
		return mav;

	}

}

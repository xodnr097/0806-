package com.libero.web.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.libero.common.Page;
import com.libero.common.Search;
import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishService;
import com.libero.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	private PublishService publishService;
	
	//Constructor
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{userProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{userProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//method
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(@RequestBody Map<String, Object> params, HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+params.get("userId"));
		User user = userService.getUser((String) params.get("userId"));
		
		if( ((String)params.get("password")).equals(user.getPassword())){
			session.setAttribute("user", user);
		}
		
		return user;
	}
	
	@RequestMapping(value="json/emailSend",method=RequestMethod.GET)
	public Map emailSend(@RequestParam("userId") String userId) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("[ /user/json/emailCheck/"+userId+" : GET]");
		System.out.println(" ---------------------------------------");
		
		////email보내는 함수 작성
		
		String verCode = mailSender(userId);
		
		System.out.println("\n\n[ "+verCode+" ]\n\n");
		
		Map map = new HashMap();
		map.put("verifCode", verCode);
		
		////리턴 값 설정 해주기.
		return map;
	}
	
	public String mailSender(String userId) throws AddressException, MessagingException {
		
		String host = "smtp.naver.com"; 
		final String username = "wjddbstp"; //네이버 아이이디 
		final String password = "mnbv48451"; //네이버 비번 
		int port=465; 
		String verCode=UserRestController.getAlphaNumericString();
		String recipient = userId; //받는 사람 이메일 주소 
		String subject = "이메일 인증입니다."; //메일 제목 
		String body = "libLIBERO Email Verification Code\n\t\t"+"[ "+ verCode+" ]"; //메일 내용
		Properties props = System.getProperties(); // 메일 제목, 내용을 담을 properties 만들기. 
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw);
				} }); 
		session.setDebug(true); //for debug 
		Message messageContent = new MimeMessage(session); 
		//MimeMessage 
			
			String email = "wjddbstp@naver.com";	
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
			messageContent.setFrom(emailAddr); 
			 // 보내기 
		
			//발신자  이메일 세팅
			messageContent.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자 세팅 
			messageContent.setSubject(subject); //제목 세팅 
			messageContent.setText(body); //내용 세팅
			Transport.send(messageContent);	
		//javax.mail.Transport.send() 이용하는 거임
		return verCode;
	}
	
	
	@RequestMapping(value="json/duplicationCheck",method=RequestMethod.GET)
	public boolean duplicationCheck(@Param("userId") String userId) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("[ /user/json/duplicationCheck/"+userId+" : GET]");
		System.out.println(" ---------------------------------------");
		
		
		boolean	result = userService.duplicationCheck(userId);
	System.out.println("\n\n\n\n"+result+"\n\n\n");
		return result;
	}
	
	@RequestMapping(value="json/duplicationNick",method=RequestMethod.GET)
	public boolean duplicationNick(@Param("nickname") String nickname) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("[ /user/json/duplicationCheck/"+nickname+" : GET]");
		System.out.println(" ---------------------------------------");
		
		boolean result = userService.duplicationNick(nickname);
		return result;
	}
///////////////////////////////////////////랜덤 코드 생성기
	static String getAlphaNumericString() { 
		
		
		 int n = 10; //length of the number
        
		
		// chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString.charAt(index)); 
        }
        return sb.toString(); 
    } 
	
	@RequestMapping(value="json/getUserPublishList/{prodType}")
	public Map getUserPublishList(HttpSession session, @PathVariable("prodType") String prodType, Publish publish,@RequestBody Search search) throws Exception {
		
		System.out.println("/user/json/getUserPublishList : GET, POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		publish.setProdType(prodType);
		publish.setCreator(((User)session.getAttribute("user")).getUserId());
		
		Map<String , Object> map=publishService.getUserPublishList(publish, search);
		Page resultPage = new Page(search.getCurrentPage(),
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map map01 = new HashMap();
		map01.put("list", map.get("list"));
		map01.put("resultPage", resultPage);
		map01.put("search", search);
		return map01;
	}
	
	@RequestMapping(value = "json/kakaologin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
		System.out.println("/user/json/kakaologin");
		
		ModelAndView mav = new ModelAndView(); 
		
		User user = (User) session.getAttribute("user");	
		JsonNode node = SNSloginController.getAccessToken(code); 
		JsonNode accessToken = node.get("access_token");
		
		JsonNode userInfo = SNSloginController.getKakaoUserInfo(accessToken); 
		JsonNode kakaoAccount = userInfo.path("kakao_account");	
		JsonNode properties = userInfo.path("properties");	
		
		String kId = userInfo.path("id").asText();	
		String kEmail = kakaoAccount.path("email").asText();
		String kNickname = properties.path("nickname").asText(); 		
		String kGender = kakaoAccount.path("gender").asText();

		
		if(user == null) {
			user = new User();
			
			if(userService.getUserByKakao(kId) != null) {		
				user = userService.getUserByKakao(kId);
			}else if(userService.getUser(kEmail) != null) {
				user = userService.getUser(kEmail);
			}else if(userService.getUserByKakao(kId) == null && userService.getUser(kEmail) == null) {			
				user.setUserId(kEmail);	
				user.setPassword((UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 14));
				user.setKakaoId(kId);
				user.setNickname(kNickname);
				if(kGender != null) {
					user.setGenderCode(kGender.substring(0,1));
				}
				
				userService.addUser(user);				
				user = userService.getUser(user.getUserId());
			}		
		}else { 
			User kUser = userService.getUser(kEmail);
			if(kUser == null) {
				userService.addKakaoId(user.getUserId(), kId);				
			}else {
				//user_id가 kakao_id인 모든 테이블을 user.getUserId()로 바꿔주기
				userService.delUser(kId);
			}
		}
					
		session.setAttribute("user", user);
		mav.setViewName("redirect:/");
		
		return mav; 
		}
	
	@RequestMapping(value = "json/kakaoLogout", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogout(HttpSession session) throws Exception {
		System.out.println("/user/json/kakaoLogout");
		
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("redirect:/");
		
		return mav; 			
	}
	
}
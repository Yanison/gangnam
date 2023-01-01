# SgWorld_캐릭터 조작과 실시간 채팅 및, 화상채팅이 가능한 커뮤니티 서비스

### 프로젝트 개요 및 목적.
- WebSocket과 WebRTC를 활용한 실시간 메타버스 커뮤니케이션 어플리케이션 서비스 개발


### 사용언어 및 개발환경
- System : AWS EC2 : CentOS 7<br>
- DB : AWS RDS : Mysql<br>
- FrontEnd-Language: javaScript,jQeury,Ajax<br>
- BackEnd-Language:Java<br>
- BackEnd-Framework:Spring,mybatis,maven<br>
- was:tomcat 9.0<br>


### 참고자료
- WebRTC<br>
mozila webRTC 공식문서 <br>
https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API<br>
노마드 코더 WebRTC 강의<br>
https://nomadcoders.co/noom/lectures/3077<br>
- HTML Canvas<br>
Mozilla 공튀기기 게임 튜토리얼<br>
https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript/Create_the_Canvas_and_draw_on_it<br>
JS&Canvas & Node.js _ sokect.io를 활용한 실시간 2d 게임 구현<br>
https://god-gil.tistory.com/78<br>


### 프로젝트 구조

- Back-end
📦main<br>
 ┣ 📂java<br>
 ┃ ┗ 📂com<br>
 ┃ ┃ ┗ 📂sgworld<br>
 ┃ ┃ ┃ ┗ 📂infra<br>
 ┃ ┃ ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂interceptor<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CheckLoginSessionInterception.java<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂util<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MailService.java &nbsp;&nbsp;::&nbsp;&nbsp; 구글STMP 메일서버 &  이메일인증 서비스 로직 <br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SMS.java &nbsp;&nbsp;::&nbsp;&nbsp; 휴대폰 인증 서비스로직(현제 계정 사용중지)<br>
 ┃ ┃ ┃ ┃ ┗ 📂modules<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin<br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂home <br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂member<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂sgWorld &nbsp;&nbsp;::&nbsp;&nbsp; 실시간 채팅방 및 화상채팅 관련 서비스 로직 package<br> 
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂Controller<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgWorldController.java &nbsp;&nbsp;::&nbsp;&nbsp; 페이지 매핑 컨트롤러<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgwRestController.java &nbsp;&nbsp;::&nbsp;&nbsp; restful api 컨트롤러<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SgwWSController.java &nbsp;&nbsp;::&nbsp;&nbsp; STOMP webSocket 컨트롤러<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sgwSocket<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SgWorldSocketConfiguration.java &nbsp;&nbsp;::&nbsp;&nbsp; websocket configurer class <br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sgwdto<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgwDao.java<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgwMapper.xml<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgwSerivce.java<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SgwSerivceImpl.java<br>
 ┣ 📂resources<br>
 ┃ ┣ 📜log4j.dtd<br>
 ┃ ┣ 📜log4j.xml<br>
 ┃ ┣ 📜log4jdbc.log4j2.properties<br>
 ┃ ┗ 📜mybatis-config.xml<br>
 
 
 
- Front-end
 ┗ 📂webapp<br>
 ┃ ┣ 📂META-INF<br>
 ┃ ┃ ┗ 📜MANIFEST.MF<br>
 ┃ ┣ 📂WEB-INF<br>
 ┃ ┃ ┣ 📂lib<br>
 ┃ ┃ ┣ 📂spring<br>
 ┃ ┃ ┃ ┣ 📂appServlet<br>
 ┃ ┃ ┃ ┃ ┗ 📜servlet-context.xml<br>
 ┃ ┃ ┃ ┣ 📜.DS_Store<br>
 ┃ ┃ ┃ ┗ 📜root-context.xml<br>
 ┃ ┃ ┣ 📂views<br>
 ┃ ┗ 📂resources<br>
 ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┣ 📂user<br>
 ┃ ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┣ 📂home &nbsp;&nbsp;::&nbsp;&nbsp; 홈페이지 관련 css,js resources folder <br>
 ┃ ┃ ┃ ┃ ┣ 📂js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂userSignIn &nbsp;&nbsp;::&nbsp;&nbsp; 회원가입 유효성 검사 로직 script<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜buildMySGW.js &nbsp;&nbsp;::&nbsp;&nbsp; 채팅방 개설 로직 script<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜home.js <br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜modal.js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userLogin.js<br>
 ┃ ┃ ┃ ┃ ┗ 📜.DS_Store<br>
 ┃ ┃ ┃ ┣ 📂member<br>
 ┃ ┃ ┃ ┃ ┗ 📂css<br>
 ┃ ┃ ┃ ┗ 📂sgworld<br>
 ┃ ┃ ┃ ┃ ┣ 📂css<br>
 ┃ ┃ ┃ ┃ ┣ 📂images<br>
 ┃ ┃ ┃ ┃ ┗ 📂js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sgWorld.js &nbsp;&nbsp;::&nbsp;&nbsp; 실시간 채팅 및 화상채팅 로직 및 아바타 조작 로직 script <br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📜sgWorldRequets.js &nbsp;&nbsp;::&nbsp;&nbsp; client to server-side restful api 요청  script <br>
 
 
 
 
 
 
 <br>
 <br>
 <br>
 ## ERD-Model
 
 ![SGWorldERD](https://user-images.githubusercontent.com/88885019/210168387-db11a778-dc72-48ad-9700-17d03fbc488b.png)


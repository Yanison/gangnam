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
-HTML Canvas<br>
Mozilla 공튀기기 게임 튜토리얼<br>
https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript/Create_the_Canvas_and_draw_on_it<br>
JS&Canvas & Node.js _ sokect.io를 활용한 실시간 2d 게임 구현<br>
https://god-gil.tistory.com/78<br>


### 프로젝트 구조
📦main
 ┣ 📂java<br>
 ┃ ┗ 📂com<br>
 ┃ ┃ ┗ 📂sgworld<br>
 ┃ ┃ ┃ ┗ 📂infra<br>
 ┃ ┃ ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂interceptor<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CheckLoginSessionInterception.java<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂util<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MailService.java<br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SMS.java<br>
 ┃ ┃ ┃ ┃ ┗ 📂modules<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin<br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂home<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂member<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂sgWorld<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂Controller<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgWorldController.java<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SgwRestController.java<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SgwWSController.java<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂sgwSocket<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SgWorldSocketConfiguration.java<br>
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
 ┃ ┃ ┃ ┣ 📂ERD<br>
 ┃ ┃ ┃ ┣ 📂infra<br>
 ┃ ┃ ┃ ┃ ┗ 📂user<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📂modules<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂home<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂member<br>
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂sgWorld<br>
 ┃ ┃ ┃ ┣ 📂rscs<br>
 ┃ ┃ ┃ ┣ 📂test<br>
 ┃ ┃ ┗ 📜web.xml<br>
 ┃ ┗ 📂resources<br>
 ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┣ 📂css<br>
 ┃ ┃ ┃ ┣ 📂font<br>
 ┃ ┃ ┃ ┣ 📂images<br>
 ┃ ┃ ┃ ┣ 📂js<br>
 ┃ ┃ ┣ 📂user<br>
 ┃ ┃ ┃ ┣ 📂common<br>
 ┃ ┃ ┃ ┣ 📂home<br>
 ┃ ┃ ┃ ┃ ┣ 📂js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📂userSignIn<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜buildMySGW.js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜home.js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜modal.js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userLogin.js<br>
 ┃ ┃ ┃ ┃ ┗ 📜.DS_Store<br>
 ┃ ┃ ┃ ┣ 📂member<br>
 ┃ ┃ ┃ ┃ ┗ 📂css<br>
 ┃ ┃ ┃ ┗ 📂sgworld<br>
 ┃ ┃ ┃ ┃ ┣ 📂css<br>
 ┃ ┃ ┃ ┃ ┣ 📂images<br>
 ┃ ┃ ┃ ┃ ┗ 📂js<br>
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sgWorld.js<br>
 ┃ ┃ ┃ ┃ ┃ ┗ 📜sgWorldRequets.js<br>

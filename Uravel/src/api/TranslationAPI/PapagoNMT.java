package api.TranslationAPI;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


public class PapagoNMT {
 
	public static String KOREAN = "ko";
	public static String ENGLISH = "en";
	public static String JAPANESE = "ja";
	public static String CHINESE = "zh-CN";
	
    // 파파고 API 서버 주소
	private static String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	// 애플리케이션 클라이언트 아이디값
	private static String clientId = "_dGNBTV6fTRgReUlAZNa";
	// 애플리케이션 클라이언트 시크릿값
	private static String clientSecret = "MFuB8m6YIU";
	
	public static String translate(String source, String target, String text) {
		
		
		try {
			// 변환할 문장을 UTF-8 유니코드로 인코딩
            text = URLEncoder.encode(text, "UTF-8");
            
            // 파파고 API 서버와 연결
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            // 파파고 API 서버로 전달할 파라미터 설정
            String postParams = "source="+source+"&target="+target+"&text="+text;
            
            // 파파고 API 서버로 번역할 문장 전송
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            
            //파파고 API 서버로부터 번역된 메세지 전달받기
            int responseCode = con.getResponseCode();
            BufferedReader br;
            // 번역에 성공한 경우
            if (responseCode == 200) { // 정상 응답
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 응답
            	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            // 전달받은 메세지 출력
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while((inputLine = br.readLine()) != null) {
            	response.append(inputLine);
            }
            br.close();
            return response.toString();
        } catch (Exception e) {
            return "파파고 API 통신 중 오류가 발생했습니다.";
        }
		
		
	}
        
}
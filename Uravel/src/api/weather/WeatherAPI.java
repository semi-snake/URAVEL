package api.weather;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.dto.WeatherDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class WeatherAPI {
	private static String apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=647b43059ef647e63a8046f5345b29b7";

	public JsonObject requestInfo(String name) {
		URL url = null;
		URLConnection request = null;
		JsonObject res = null;
		
		try {
			url = new URL(apiURI);
			request = url.openConnection();
			request.connect();
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(new InputStreamReader((InputStream) request.getContent()));
			
			if(name.equals("weather")) {
				JsonElement weather_e = element.getAsJsonObject().get("weather");
				JsonObject weather = weather_e.getAsJsonArray().get(0).getAsJsonObject();
				
				res = weather;
			} else if(name.equals("main")) {
				JsonObject main = element.getAsJsonObject().get("main").getAsJsonObject();
				res = main;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}
}

package api.dialog;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Dialog {
	private String openApiURL = "http://aiopen.etri.re.kr:8000/Dialog";
	private String accessKey = "d40bbf1a-162e-496c-b400-079f245707fc";

	public JsonObject open() {
		String domain = "Get_Travel_Info";
		String access_method = "ACCESS_METHOD";
		String method = "open_dialog";
		Gson gson = new Gson();

		JsonObject return_object = null;

		Map<String, Object> request = new HashMap<>();
		Map<String, String> argument = new HashMap<>();

		///////// OPEN DIALOG /////////

		argument.put("name", domain);
		argument.put("access_method", "internal_data");
		argument.put("method", method);

		request.put("access_key", accessKey);
		request.put("argument", argument);

		URL url;
		Integer responseCode = null;
		String responseBody = null;

		try {
			url = new URL(openApiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(gson.toJson(request).getBytes("UTF-8"));
			wr.flush();
			wr.close();

			responseCode = con.getResponseCode();
			InputStream is = con.getInputStream();
			byte[] buffer = new byte[is.available()];
			int byteRead = is.read(buffer);
			responseBody = new String(buffer);

			JsonParser parser = new JsonParser();
			JsonObject response = (JsonObject) parser.parse(responseBody);

			return_object = response.getAsJsonObject("return_object");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return return_object;
	}

	public JsonObject dialog(String uuid, String message) {
		String method = "dialog";
		String text = message;
		Gson gson = new Gson();

		JsonObject return_object = null;

		Map<String, Object> request = new HashMap<>();
		Map<String, String> argument = new HashMap<>();

		//////// OPEN DIALOG ////////

		argument.put("uuid", uuid);
		argument.put("method", method);
		argument.put("text", text);

		request.put("access_key", accessKey);
		request.put("argument", argument);

		try {
			URL url;
			Integer responseCode = null;
			String responseBody = null;

			url = new URL(openApiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(gson.toJson(request).getBytes("UTF-8"));
			wr.flush();
			wr.close();

			responseCode = con.getResponseCode();
			InputStream is = con.getInputStream();
			byte[] buffer = new byte[is.available()];
			int byteRead = is.read(buffer);
			responseBody = new String(buffer);

			JsonParser parser = new JsonParser();
			JsonObject response = (JsonObject) parser.parse(responseBody);
			return_object = response.getAsJsonObject("return_object");

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return return_object;
	}

	public void close(String uuid) {
		String method = "close_dialog";
		Gson gson = new Gson();

		Map<String, Object> request = new HashMap<>();
		Map<String, String> argument = new HashMap<>();

		//////// CLOSE DIALOG ////////

		argument.put("uuid", uuid);
		argument.put("method", method);

		request.put("access_key", accessKey);
		request.put("argument", argument);

		try {
			URL url;
			Integer responseCode = null;
			String responseBody = null;

			url = new URL(openApiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(gson.toJson(request).getBytes("UTF-8"));
			wr.flush();
			wr.close();

			responseCode = con.getResponseCode();
			InputStream is = con.getInputStream();
			byte[] buffer = new byte[is.available()];
			int byteRead = is.read(buffer);
			responseBody = new String(buffer);
			
			System.out.println(responseBody);
			

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

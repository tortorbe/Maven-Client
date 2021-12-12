package utilitaire;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Type;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.Buffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.reflect.TypeToken;

import bean.VilleFrance;


public class RestResponse {
	
	private static final String URL_GET_ALL = "http://localhost:8181/villes";
	private static final String URL_POST = "http://localhost:8181/villes/modifier";
	
	private static CloseableHttpClient client = HttpClients.createDefault();
	
	public static List<VilleFrance> getAll() throws ClientProtocolException, IOException {
		HttpGet request = new HttpGet(URI.create(URL_GET_ALL));
		
		request.setHeader("accept", "application/json");
		
		HttpResponse response = client.execute(request);
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(EntityUtils.toString(response.getEntity()), new TypeReference<List<VilleFrance>>() {});

	}
	
	
	public static boolean post(VilleFrance ville) throws URISyntaxException {
		boolean modificationEffectue = false;
		URIBuilder builder = new URIBuilder()
			.setScheme("http")
			.setHost("localhost:8181")
			.setPath("update/"+ville.getCode_commune_INSEE());
		System.out.println(builder.getPath());
		HttpPut request = new HttpPut(builder.build());
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String json = mapper.writeValueAsString(ville);
			StringEntity entity = new StringEntity(json);
			request.setEntity(entity);
			request.setHeader("accept", "application/json");
			request.setHeader("content-type", "application/json");
			HttpResponse response = client.execute(request);
			if (response.getStatusLine().getStatusCode() == 200) {
				System.out.println("modification effectuee");
				modificationEffectue = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return modificationEffectue;
	}
	
	public static boolean delete(VilleFrance ville) throws URISyntaxException {
		boolean suppressionEffectue = false;
		URIBuilder builder = new URIBuilder()
			.setScheme("http")
			.setHost("localhost:8181")
			.setPath("delete/"+ville.getCode_commune_INSEE());
		System.out.println(builder.getPath());
		HttpDelete request = new HttpDelete(builder.build());
		//ObjectMapper mapper = new ObjectMapper();
		
		try {
			request.setHeader("accept", "application/json");
			request.setHeader("content-type", "application/json");
			HttpResponse response = client.execute(request);
			if (response.getStatusLine().getStatusCode() == 200) {
				System.out.println("suppression effectuee");
				suppressionEffectue = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return suppressionEffectue;
	}
	
	public static List<VilleFrance> getWithParams(HashMap<String, String> params) throws URISyntaxException, ClientProtocolException, IOException {
		URIBuilder builder = new URIBuilder()
				.setScheme("http")
				.setHost("localhost:8181")
				.setPath("trouver");
		
		for(Entry<String, String> entry : params.entrySet()) {
			builder.addParameter(entry.getKey(), entry.getValue());
		}
		
		HttpGet request = new HttpGet(builder.build());
		request.setHeader("accept", "application/json");
		
		HttpResponse response = client.execute(request);
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(EntityUtils.toString(response.getEntity()), new TypeReference<List<VilleFrance>>() {});
	}
	
	
	
}

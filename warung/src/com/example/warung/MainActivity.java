package com.example.warung;

import java.util.ArrayList;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class MainActivity extends Activity {
	
	private ListView listView;
	private ArrayAdapter<String> adapter;
	private ArrayList<String> barangList;
	private Handler handler = new Handler();

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		// Initialize
		listView = (ListView) findViewById(R.id.listView);
		barangList = new ArrayList<String>();
		adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, barangList);
		listView.setAdapter(adapter);
		
		getData();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	private void getData() {
		Thread thread = new Thread(new Runnable() {
			@Override
			public void run() {
				String urlString = "https://192.168.56.5/warung/getData.php";
				
//				String urlString = "https://bad5-182-3-50-189.ngrok-free.app/warung/getData.php";
				
				try {
					URL url = new URL(urlString);
					HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
					urlConnection.setRequestMethod("GET");
					
					BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
					StringBuilder stringBuilder = new StringBuilder();
					String line;
					
					
					while ((line = reader.readLine()) != null) {
						stringBuilder.append(line);
						Log.d("MainActivity", line);
					}
					
					reader.close();
					urlConnection.disconnect();
					parseJSON(stringBuilder.toString());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
		thread.start();
	}
	
	private void parseJSON(final String json) {
		handler.post(new Runnable() {
			@Override
			public void run() {
				try {
					JSONArray jsonArray = new JSONArray(json);
					for (int i = 0; i < jsonArray.length(); i++) {
						JSONObject jsonObject = jsonArray.getJSONObject(i);
						String kode = jsonObject.getString("kode");
						String nama = jsonObject.getString("nama");
						String jenis = jsonObject.getString("jenis");
						String harga = jsonObject.getString("harga");
						String stok = jsonObject.getString("stok");
						
						String item = "Kode: " + kode + "\nNama: " + nama + "\nJenis" + jenis + "\nHarga" + harga + "\nStoks" + stok;
						
						barangList.add(item);
					}
					
					adapter.notifyDataSetChanged();
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
		});
	}
}

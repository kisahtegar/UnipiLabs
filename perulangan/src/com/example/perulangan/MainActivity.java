package com.example.perulangan;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		// Daftar nama teman
		String[] friendsArray = {"Putri", "Fitri", "Andi", "Dian"};
		
		// Using ArrayList for dynamic data manipulation
		ArrayList<String> friendsList = new ArrayList<String>();
		
		// Using foreach to add elements to the ArrayList
		for (String friend : friendsArray) {
			friendsList.add(friend);
		}
		
		// Take reference to ListView from XML
		final ListView listView = (ListView) findViewById(R.id.listView);
		
		// Make adapter for ListView
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(
				this, 
				android.R.layout.simple_list_item_1, 
				friendsList
		);
		
		// Setting adapter to ListView
		listView.setAdapter(adapter);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}

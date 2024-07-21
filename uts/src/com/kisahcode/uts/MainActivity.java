package com.kisahcode.uts;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	
	private static final double DISCOUNT_10_PERCENT = 10.0;
	private static final double DISCOUNT_25_PERCENT = 25.0;
	private static final double THRESHOLD_10_PERCENT = 1000000.0;
	private static final double THRESHOLD_25_PERCENT = 2000000.0;
	
	EditText editBiayaJasa, editBiayaGantiOli, editBiayaSparepart;
	Button btnHasil;
	TextView tvHasil;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		btnHasil = (Button)findViewById(R.id.btnHasil);
        editBiayaJasa = (EditText)findViewById(R.id.etBiayaJasa);
        editBiayaGantiOli = (EditText)findViewById(R.id.etBiayaGantiOli);
        editBiayaSparepart = (EditText)findViewById(R.id.etBiayaSparepart);
        tvHasil = (TextView)findViewById(R.id.tvHasil);
        
        btnHasil.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {

				try {
					double biayaJasa = Double.parseDouble(editBiayaJasa.getText().toString());
	                double biayaGantiOli = Double.parseDouble(editBiayaGantiOli.getText().toString());
	                double biayaSparepart = Double.parseDouble(editBiayaSparepart.getText().toString());
					
	                double totalBiaya = biayaJasa + biayaGantiOli + biayaSparepart;
	                double discountRate;
	                double discountAmount;
	                double finalTotal;

	                if (totalBiaya > THRESHOLD_25_PERCENT) {
	                    discountRate = DISCOUNT_25_PERCENT;
	                } else if (totalBiaya > THRESHOLD_10_PERCENT) {
	                    discountRate = DISCOUNT_10_PERCENT;
	                } else {
	                    discountRate = 0.0;
	                }
					
	                discountAmount = totalBiaya * (discountRate / 100);
	                finalTotal = totalBiaya - discountAmount;

	                tvHasil.setText(String.format("Biaya: %.2f\nDiskon: Mendapat Diskon %.0f%%\n\nTotal: %.2f",totalBiaya, discountRate, finalTotal));
	                
				} catch(NumberFormatException e) {
					Toast.makeText(MainActivity.this, "Please enter valid numbers", Toast.LENGTH_SHORT).show();
				}
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}

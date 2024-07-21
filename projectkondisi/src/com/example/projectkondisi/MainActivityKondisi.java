package com.example.projectkondisi;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivityKondisi extends Activity {
	EditText editNilaiUas, editNilaiUts, editNilaiTugas;
	Button btnCheck;
	TextView tvHasil;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_activity_kondisi);
        
        final Button btnCheck = (Button)findViewById(R.id.btnCheck);
        final EditText editNilaiUas = (EditText)findViewById(R.id.editNilaiUas);
        final EditText editNilaiUts = (EditText)findViewById(R.id.editNilaiUts);
        final EditText editNilaiTugas = (EditText)findViewById(R.id.editNilaiTugas);
        final TextView tvHasil = (TextView)findViewById(R.id.tvHasil);
        
        btnCheck.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				int nilaiUAS = Integer.parseInt(editNilaiUas.getText().toString());
				int nilaiUTS = Integer.parseInt(editNilaiUts.getText().toString());
				int nilaiTugas = Integer.parseInt(editNilaiTugas.getText().toString());
				
				double rataRata = (nilaiUAS + nilaiUTS + nilaiTugas) / 3.0;
				
				String status;
				String grade;
				
				if (rataRata >= 90 && rataRata <= 100) {
					status = "Lulus";
					grade = "A";
				} else if (rataRata >= 80 && rataRata <= 89) {
					status = "Lulus";
					grade = "B";
				} else if (rataRata >= 70 && rataRata <= 79) {
					status = "Lulus";
					grade = "C";
				} else if (rataRata >= 60 && rataRata <= 69) {
					status = "Lulus";
					grade = "D";
				} else if (rataRata >= 0 && rataRata <= 59) {
					status = "Tidak Lulus";
					grade = "E";
				} else {
					status = "Data Invalid";
					grade = "E";
				}
				
				tvHasil.setText("Rata-rata Nilai: " + String.format("%.2f", rataRata) + "\nStatus: " + status + "\nGrade: " + grade);
			}
		});
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main_activity_kondisi, menu);
        return true;
    }
}

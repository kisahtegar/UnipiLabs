package com.kisahtegar.mycalculator;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity {
	
	private EditText editText;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		editText = (EditText)findViewById(R.id.etInputBox);

		// ============================================================
        // Find all buttons
		// Layer 1
		final Button btnDoubleZero = (Button)findViewById(R.id.btnDoubleZero);
		final Button btnZero = (Button)findViewById(R.id.btnZero);
		final Button btnComma = (Button)findViewById(R.id.btnComma);
		final Button btnEqual = (Button)findViewById(R.id.btnEqual);
		
		// Layer 2
		final Button btnOne = (Button)findViewById(R.id.btnOne);
		final Button btnTwo = (Button)findViewById(R.id.btnTwo);
		final Button btnThree = (Button)findViewById(R.id.btnThree);
		final Button btnPlus = (Button)findViewById(R.id.btnPlus);
		
		// Layer 3
		final Button btnFour = (Button)findViewById(R.id.btnFour);
		final Button btnFive = (Button)findViewById(R.id.btnFive);
		final Button btnSix = (Button)findViewById(R.id.btnSix);
		final Button btnMinus = (Button)findViewById(R.id.btnMinus);
		
		// Layer 4
		final Button btnSeven = (Button)findViewById(R.id.btnSeven);
		final Button btnEight = (Button)findViewById(R.id.btnEight);
		final Button btnNine = (Button)findViewById(R.id.btnNine);
		final Button btnMultiple = (Button)findViewById(R.id.btnMultiple);
		
		// Layer 5
		final Button btnClearAll = (Button)findViewById(R.id.btnClearAll);
		final Button btnPercent = (Button)findViewById(R.id.btnPercent);
		final Button btnDelete = (Button)findViewById(R.id.btnDelete);
		final Button btnDivide = (Button)findViewById(R.id.btnDivide);
		
		// ============================================================
		// Set OnClickListener for each button
		// ------------------------- Layer 1 --------------------------
		btnDoubleZero.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("00");
			}
		});
		btnZero.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("0");
			}
		});
		btnComma.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append(",");
			}
		});
		btnEqual.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				// Get the expression from the EditText
                String expression = editText.getText().toString();
                // Calculate the result
                double result = calculateResult(expression);
                // Display the result in EditText
                editText.setText(Double.toString(result));
			}
		});
		
		// ------------------------- Layer 2 --------------------------
		btnOne.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("1");
			}
		});
		btnTwo.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("2");
			}
		});
		btnThree.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("3");
			}
		});
		btnPlus.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("+");
			}
		});
		
		// ------------------------- Layer 3 --------------------------
		btnFour.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("4");
			}
		});
		btnFive.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("5");
			}
		});
		btnSix.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("6");
			}
		});
		btnMinus.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("-");
			}
		});
		
		// ------------------------- Layer 4 --------------------------
		btnSeven.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("7");
			}
		});
		btnEight.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("8");
			}
		});
		btnNine.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("9");
			}
		});
		btnMultiple.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("*");
			}
		});
		
		// ------------------------- Layer 5 --------------------------
		btnClearAll.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.setText("");
			}
		});
		btnPercent.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("%");
			}
		});
		btnDelete.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				String currentText = editText.getText().toString();
				editText.setText(currentText.substring(0, currentText.length() - 1));
//                if (!currentText.isEmpty()) {
//                    editText.setText(currentText.substring(0, currentText.length() - 1));
//                }
			}
		});
		btnDivide.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View arg0) {
				editText.append("/");
			}
		});
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	 // Method to calculate result
    private double calculateResult(String expression) {
    	// Trim any leading or trailing whitespace from the expression
        expression = expression.trim();

        // Split the expression into individual tokens (numbers and operators)
        String[] tokens = expression.split("\\s+");

        // Initialize variables to store the result and the current operator
        double result = 0;
        char currentOperator = '+';

        // Iterate over the tokens and perform the arithmetic operations
        for (String token : tokens) {
            // If the token is a number, parse it and perform the operation
            try {
                double number = Double.parseDouble(token);
                switch (currentOperator) {
                    case '+':
                        result += number;
                        break;
                    case '-':
                        result -= number;
                        break;
                    case '*':
                        result *= number;
                        break;
                    case '/':
                        // Check for division by zero
                        if (number == 0) {
                            throw new ArithmeticException("Division by zero");
                        }
                        result /= number;
                        break;
                }
            } catch (NumberFormatException e) {
                // If the token is not a number, assume it's an operator
                currentOperator = token.charAt(0);
            }
        }

        // Return the final result
        return result;
    }
    
}

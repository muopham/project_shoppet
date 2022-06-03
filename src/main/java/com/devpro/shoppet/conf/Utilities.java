package com.devpro.shoppet.conf;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class Utilities {
	public static String formatCurrency(BigDecimal value) {
		Locale loc = new Locale("vi", "VN");
	    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
	    return nf.format(value);
	}
}

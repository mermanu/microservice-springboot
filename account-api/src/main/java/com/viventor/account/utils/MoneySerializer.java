/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.utils;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author manuelmerida
 */
public class MoneySerializer extends JsonSerializer<BigDecimal> {
    
    @Override
    public void serialize(BigDecimal value, JsonGenerator jgen, SerializerProvider provider) throws IOException,
            JsonProcessingException {
        try {
            
            jgen.writeString(getLocaleValue(value));
        } catch (Exception e) {
            jgen.writeString(value.toString());
        }
    }
    
    public static String getLocaleValue(BigDecimal value) {
        Locale germanLocale = new Locale("de", "DE");
        NumberFormat germanFormat = NumberFormat.getCurrencyInstance(germanLocale);
        return germanFormat.format(value.setScale(2, BigDecimal.ROUND_HALF_UP));
    }
}

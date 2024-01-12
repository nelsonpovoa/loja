package com.example.teste3.converter;

import java.util.Base64;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class Base64ByteConverter implements AttributeConverter<String, byte[]> {

    @Override
    public byte[] convertToDatabaseColumn(String _attribute) {
    	byte[] img=null;
    	if (_attribute != null) {
    		if (_attribute.indexOf(",")!= -1) {
    			String str = _attribute.split(",")[1];
    			img = Base64.getDecoder().decode(str);
    		}else {
    			img = Base64.getDecoder().decode(_attribute);
    		}
    	}
        return img;
    }

    @Override
    public String convertToEntityAttribute(byte[] _data) {
    	String img=null;
    	if (_data != null) {
    		img = "data:image/png;base64,"+Base64.getEncoder().encodeToString(_data);
    	}
    	return img;
    	
    }
}

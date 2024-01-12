package com.example.teste3.models.enums;

import java.util.Objects;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 
 * @author Administrator
 *
 */

@AllArgsConstructor
@Getter
public enum TipoEnum {

	NOSELECT(0, "NaoSelecionar"), MAN(1, "Homem"), WOMAN(2, "Senhora"), CHILD(3, "Crianca"), BEBE(4, "Bebe"), HOME(5, "Texteis"), CALCADO(6, "Calcado");

	@Id
	private Integer code;
	private String description;

	TipoEnum(int i, String string) {
		this.code = i;
		this.description = string;
	}

	public static TipoEnum toEnum(Integer code) {
		if (Objects.isNull(code))
			return null;

		for (TipoEnum x : TipoEnum.values()) {
			if (code.equals(x.getCode()))
				return x;
		}

		throw new IllegalArgumentException("Invalid code: " + code);
	}

	public Integer getCode() {
		return this.code;
	}

	public String getDescription() {
		return description;
	}

}

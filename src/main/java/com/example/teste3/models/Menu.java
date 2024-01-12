package com.example.teste3.models;

import java.io.Serializable;

import com.example.teste3.models.enums.TipoEnum;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "menu")
@Data
public class Menu implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	private Integer idPai;
	
	private String descricao;
	
	private String pagina;
	
	private Boolean link;
	
	private Integer numProducts;
	
	private Integer ordem;
	
	private Boolean activo;
}

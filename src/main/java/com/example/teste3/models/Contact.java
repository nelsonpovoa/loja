package com.example.teste3.models;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.Query;

import com.example.teste3.converter.LocalDateTimeConverter;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "contacts")
@Data
@NamedQuery(name="findQuery", query="select c from Contact c where c.id=:id")
public class Contact implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	@Column(length = 128, nullable = false)
	private String nome; 
	
	@Column(length = 128, nullable = false)
	private String assunto;
	
	@Column(length = 128, nullable = false)
	private String email;
	
	@Column(columnDefinition = "text", nullable = false)
	private String descricao;
	
	@Column
	@Convert(converter = LocalDateTimeConverter.class)
	private LocalDateTime data;
	
	private Boolean activo; 
	
	@ManyToOne
	@JoinColumn(name = "id_user", nullable = true, insertable = true, updatable = false)
	private Usuario user;
	
	@ManyToOne
	@JoinColumn(name = "id_pai", nullable = true, insertable = true, updatable = false)
	private Contact pai;
	
	@OneToOne
	@JoinColumn(name = "id_email", nullable = true, insertable = true, updatable = false)
	private Email mail;
}

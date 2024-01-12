package com.example.teste3.models;



import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import com.example.teste3.converter.Base64ByteConverter;
//import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters.LocalDateTimeConverter;
import com.example.teste3.converter.LocalDateTimeConverter;
import com.example.teste3.models.enums.TipoEnum;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "products")
@Data
public class Product implements Serializable{

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  
  @Enumerated //(EnumType.ORDINAL)
  @Column(nullable = false)
  private TipoEnum tipo;
  
  @Column(nullable = false)
  private Integer subTipo;
  
  private String marca;
  
  @Column(length = 128, nullable = false)
  private String name;

  @Column(columnDefinition = "text", nullable = false)
  private String descricao;

  @Column(length = 128, nullable = false)
  private String referencia;

  private String cor;
  
  @Column(name = "imagem", columnDefinition = "bytea", nullable = false)
  @Convert(converter = Base64ByteConverter.class)
  private String dadosImagem;
  
  @Transient
  private String thumbnailImage;
  
  private Boolean novidade;
  
  private String tempoExpira;
  
  private Date expira;
  
  private Integer ordem;
  private Integer ano;
  
  private Boolean activo;
  
  @Column(nullable = false)
  @Convert(converter = LocalDateTimeConverter.class)
  private LocalDateTime dataCriacao;
  
  private Double price;
  
  //@Temporal(TemporalType.TIMESTAMP)
  //private Timestamp dataCriacao;

}

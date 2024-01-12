package com.example.teste3.models;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import com.example.teste3.converter.Base64ByteConverter;
import com.example.teste3.converter.LocalDateTimeConverter;
import com.example.teste3.models.enums.ProfileEnum;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Table(name = Usuario.TABLE_NAME)
@Data
public class Usuario implements Serializable{
	
	public static final String TABLE_NAME = "utils";

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name = "username", length = 100, nullable = false, unique = true)
    @Size(min = 2, max = 100)
    @NotBlank
    private String username;
    
    @Column(name="nome")
    private String nome;

    @Column(name="apelido")
    private String apelido;

    @Column(name="email")
    private String email;

    @Column(name="telefone")
    private String telefone;

    @Column(name = "password", length = 60, nullable = false)
    @JsonProperty(access = Access.WRITE_ONLY)
    @Size(min = 8, max = 150)
    @NotBlank
    private String password;

    @Column(name = "photo", columnDefinition = "bytea")
    @Convert(converter = Base64ByteConverter.class)
    private String photo;
    
    @Column
	@Convert(converter = LocalDateTimeConverter.class)
	private LocalDateTime data;
    
    private Boolean activo; 
    
    @Column(name = "profile", nullable = false)
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "util_profile")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Set<Integer> profiles = new HashSet<>();
    
    
    public Set<ProfileEnum> getProfiles() {
        return this.profiles.stream().map(x -> ProfileEnum.toEnum(x)).collect(Collectors.toSet());
    }

    public void addProfile(ProfileEnum profileEnum) {
        this.profiles.add(profileEnum.getCode());
    }
    
}

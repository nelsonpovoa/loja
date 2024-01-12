package com.example.teste3.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.teste3.models.Email;



public interface EmailRepository extends JpaRepository<Email, UUID> {
}

package com.example.teste3.configs;

import java.util.Arrays;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.example.teste3.security.JWTAuthenticationFilter;
import com.example.teste3.security.JWTAuthorizationFilter;
import com.example.teste3.security.JWTUtil;

//@Configuration
//@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig2 {
	private static final  Logger logger = Logger.getLogger(SecurityConfig2.class.getName());
	
        private AuthenticationManager authenticationManager;

        @Autowired
        private UserDetailsService userDetailsService;

        @Autowired
        private JWTUtil jwtUtil;

        private static final String[] PUBLIC_MATCHERS = {
                        "/roupasb/**"
        };
        private static final String[] PUBLIC_MATCHERS_POST = {
                        "/user",
                        "/login"
        };

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        	logger.info("filterChain(HttpSecurity http)");
        	
                http.cors().and().csrf().disable();

                AuthenticationManagerBuilder authenticationManagerBuilder = http
                                .getSharedObject(AuthenticationManagerBuilder.class);
                authenticationManagerBuilder.userDetailsService(this.userDetailsService)
                                .passwordEncoder(bCryptPasswordEncoder());
                this.authenticationManager = authenticationManagerBuilder.build();

                
//                http
//                .authorizeRequests()
//                    .requestMatchers(HttpMethod.GET, "/**").permitAll()
//                    .requestMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
//                    .requestMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
//                    .requestMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")
//                    .anyRequest().authenticated()
//                .and()
//                    .formLogin()
//                .and()
//                    .httpBasic();
                
               // http.authorizeRequests().requestMatchers("/**", "/users/create/**").permitAll().and()
               // .authenticationManager(authenticationManager);;
                
                
                
                http.authorizeRequests()
                                //.requestMatchers(HttpMethod.POST, PUBLIC_MATCHERS_POST).permitAll()
                                //.requestMatchers(PUBLIC_MATCHERS).permitAll()
                                .requestMatchers(HttpMethod.GET, "/**").permitAll()
                                .anyRequest().authenticated().and()
                                .authenticationManager(authenticationManager);

                
                http.addFilter(new JWTAuthenticationFilter(this.authenticationManager, this.jwtUtil));
                http.addFilter(new JWTAuthorizationFilter(this.authenticationManager, this.jwtUtil,
                                this.userDetailsService));

               http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

                //http.sessionManagement(management -> management.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
                
                return http.build();
        }

        @Bean
        CorsConfigurationSource corsConfigurationSource() {
                CorsConfiguration configuration = new CorsConfiguration().applyPermitDefaultValues();
                configuration.setAllowedMethods(Arrays.asList("POST", "GET", "PUT", "DELETE"));
                final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
                source.registerCorsConfiguration("/**", configuration);
                return source;
        }

        @Bean
        public BCryptPasswordEncoder bCryptPasswordEncoder() {
                return new BCryptPasswordEncoder();
        }

        /* // CHATGPT 
        http
        .authorizeRequests()
            .requestMatchers(HttpMethod.GET, "/public/**").permitAll()
            .requestMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
            .requestMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
            .requestMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")
            .anyRequest().authenticated()
        .and()
            .formLogin()
        .and()
            .httpBasic();
        */
        
}

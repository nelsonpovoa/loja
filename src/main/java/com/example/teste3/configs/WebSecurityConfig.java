package com.example.teste3.configs;

import java.util.logging.Logger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionFixationProtectionStrategy;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

	private static final  Logger logger = Logger.getLogger(WebSecurityConfig.class.getName());
	
//	@Autowired 
//	private LoginSucesso loginSucesso;

	
	//@Autowired
    //SecurityFilter securityFilter;

	
	@Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		
		/*
		httpSecurity.authorizeRequests(authorizeRequests -> authorizeRequests.anyRequest()
			      .authenticated())
			      .httpBasic(withDefaults())
			      .formLogin(withDefaults())  
			      .csrf(AbstractHttpConfigurer::disable);
			    return httpSecurity.build();
			   */
		
		/*
		httpSecurity.authorizeHttpRequests((requests) -> requests
                .requestMatchers("/myAccount","/myBalance","/myLoans","/myCards").authenticated()
                .requestMatchers("/loja","/public/index/**","/contact").permitAll())
        .formLogin(Customizer.withDefaults())
        .httpBasic(Customizer.withDefaults());
		return httpSecurity.build();
*/
		
		
		
		/*
		httpSecurity.authorizeHttpRequests((requests) -> {
			try {
				requests
				        .requestMatchers("/myAccount","/myBalance","/myLoans","/myCards").authenticated()
				        .requestMatchers("/", "/loja/**","/public/index/**","/contact").permitAll().and().formLogin()
				        .and().httpBasic();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		
		
		return httpSecurity.build();
*/
		
		

		httpSecurity.authorizeHttpRequests((requests) -> requests
                .requestMatchers("/myAccount","/myLoans","/myCards").authenticated()
                .requestMatchers("/", "/loja","/public/index/**","/notices","/myBalance","/contact").permitAll())
        .formLogin(Customizer.withDefaults())
        .httpBasic(Customizer.withDefaults());
return httpSecurity.build();



		/*
		
		httpSecurity
		// .csrf(csrf -> csrf.disable())
		// .sessionManagement(session ->
		// session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
		.authorizeHttpRequests((requests) -> {
			try {
				requests.requestMatchers("/account").authenticated().requestMatchers("/admin/**").authenticated()
						.requestMatchers("/loja").permitAll()
						.requestMatchers("/login").permitAll()
						.requestMatchers("/public/index/**").permitAll()
						.requestMatchers("/roupaAdmin/**").permitAll();
				// .requestMatchers("/**").permitAll()
				// .requestMatchers(HttpMethod.GET, "/account/**").permitAll()
				// .requestMatchers(HttpMethod.GET, "/balance").permitAll()
				// .requestMatchers(HttpMethod.POST, "/auth/register").permitAll()
				// .requestMatchers(HttpMethod.POST, "/product").hasRole("ADMIN")
				// .and().formLogin().and().httpBasic();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		
		httpSecurity.formLogin().loginPage("/login3");
		httpSecurity.httpBasic();
		
		return httpSecurity.build();
		*/




		/*
		return httpSecurity
                .csrf()
                .disable()
                .authorizeHttpRequests()
                .requestMatchers("/loja",
						"/public/index/**",
						"/img/**",
				        "/css/**",
				        "/webjars/**")
                .permitAll()
                
                .requestMatchers("/roupaAdmin/**",
                		"/admin/**")
                .authenticated()
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                //.addFilterBefore(authFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
		
		*/
		
		
		/*
		httpSecurity.authorizeRequests(authorizeRequests -> {
			try {
				authorizeRequests.requestMatchers("/**",
						"/public/index/**",
						"/img/**",
				        "/css/**",
				        "/webjars/**").permitAll().and()
				        .authorizeHttpRequests()
				        .requestMatchers("/roupaAdmin/**")
				        .authenticated();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		})
		.httpBasic(withDefaults())
	      .formLogin(withDefaults())
				.csrf(AbstractHttpConfigurer::disable);;
			    return httpSecurity.build();
		*/
		
		
			    /*
        return  httpSecurity
                .csrf(csrf -> csrf.disable())
                //.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                		//.requestMatchers("/**").permitAll()
                		.requestMatchers("/**",
                				"/public/index/**",
                				"/img/**",
			                    "/css/**",
			                    "/webjars/**").permitAll()
                		.requestMatchers("/s/**").permitAll()
                		.requestMatchers(HttpMethod.GET, "/roupaAdmin/**").permitAll()
                        .requestMatchers(HttpMethod.GET, "/login").permitAll()
                        .requestMatchers(HttpMethod.POST, "/auth/register").permitAll()
                        .requestMatchers(HttpMethod.POST, "/product").hasRole("ADMIN")
                        //.anyRequest().authenticated()
                )
                //.addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build(); */
    }
	
	
	@Bean
	public InMemoryUserDetailsManager userDetailsService() {
	    UserDetails user = User.withUsername("user")
	      .password(encoder().encode("userPass"))
	      .roles("USER")
	      .build();
	    return new InMemoryUserDetailsManager(user);
	}
	 
	@Bean
	public PasswordEncoder encoder() {
	    return new BCryptPasswordEncoder();
	}
	
	//@Bean
    public SessionAuthenticationStrategy sessionAuthenticationStrategy() {
        return new SessionFixationProtectionStrategy();
    }
	
	//@Bean
    /*
	public UserDetailsService userDetailsService() {
		logger.info("userDetailsService");
		
		UserDetails user =
			 User.withDefaultPasswordEncoder()
				.username("nelson")
				.password("123456")
				.roles("ADMIN", "USER")
				.build();

		 UserDetails admin = User.builder()
			        .username("ricardo")
			        .password(passwordEncoder().encode("123456"))
			        .roles("USER", "ADMIN")
			        .build();
		 
		return new InMemoryUserDetailsManager(user, admin);
	}
	*/
    
    
	/*@Bean
	public PasswordEncoder passwordEncoder() {
		return NoOpPasswordEncoder.getInstance();
	}*/

//	  @Bean
//	  public PasswordEncoder passwordEncoder() {
//	    return new BCryptPasswordEncoder();
//	  }
}
package at.fhjoanneum.myusi.Security

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpMethod
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
class WebSecurityConfiguration : WebSecurityConfigurerAdapter() {
    @Autowired
    private lateinit var userDetailsService: UsiManagerUserDetailsService;

    override fun configure(http: HttpSecurity) {
        http
            .authorizeRequests()
            //.antMatchers("/**").authenticated()
            //.antMatchers(HttpMethod.GET, "/", "/login").permitAll()
            .antMatchers("/login","/register","/newUser").permitAll()
            .antMatchers("/resources/**", "/static/**","/webjars/**","/css/*","/js/*","/img/*","/").permitAll()
            .antMatchers("/denyAccess").authenticated()
            //.anyRequest().authenticated()
            .and()
            //.formLogin()
            .formLogin().loginPage("/login")
            .and()
            .logout().logoutUrl("/performLogout").logoutSuccessUrl("/")
            .invalidateHttpSession(true).deleteCookies("JSESSIONID")
            .and()
            .rememberMe().key("uniqueAndSecret").userDetailsService(userDetailsService);
    }


}


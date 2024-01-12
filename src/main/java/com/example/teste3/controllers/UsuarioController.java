package com.example.teste3.controllers;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.teste3.dao.UsuarioDao;
import com.example.teste3.models.Contact;
import com.example.teste3.models.Menu;
import com.example.teste3.models.Product;
import com.example.teste3.models.Usuario;
import com.example.teste3.models.enums.ProfileEnum;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.services.UtilService;
import com.example.teste3.utils.JWTUtil2;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

@Controller
@RequestMapping("/utils")
public class UsuarioController {

    @Autowired
    JWTUtil2 jwtUtil;

    @Autowired
    private UsuarioDao ud;

    @Autowired
    private UtilService utilService;
    
    @GetMapping(value="prueba")
    public List<String> prueba() {
        return List.of("Banana", "Maça", "Kiwi");
    }

    @GetMapping(value="usuario/{id}")
    public Usuario getUsuario(@PathVariable Long id) {
        Usuario u = new Usuario();
        u.setId(id);
        u.setNome("NElson");
        u.setApelido("Pito");
        u.setEmail("nelson@gmail.com");
        u.setTelefone("963005707");

        return u;
    }

    private boolean validarToken(String token) {
        String usuarioId = jwtUtil.getKey(token);
        return usuarioId != null;
    }

    @GetMapping(value="usuarios")
    public List<Usuario> getUsuarios(@RequestHeader(value="Authorization") String token) {
        /* List<Usuario> lista = new ArrayList<>();

        Usuario u1 = new Usuario();
        u1.setId(1L);
        u1.setNome("NElson");
        u1.setApelido("Pito");
        u1.setEmail("nelson@gmail.com");
        u1.setTelefone("963005707");

        Usuario u2 = new Usuario();
        u2.setId(2L);
        u2.setNome("NElson");
        u2.setApelido("Pito");
        u2.setEmail("nelson@gmail.com");
        u2.setTelefone("963005707");

        Usuario u3 = new Usuario();
        u3.setId(3L);
        u3.setNome("NElson");
        u3.setApelido("Pito");
        u3.setEmail("nelson@gmail.com");
        u3.setTelefone("963005707");

        lista.add(u1);
        lista.add(u2);
        lista.add(u3); */
        List<Usuario> lista = null;

        if (!validarToken(token)) { return null;}

        lista = ud.getUsuarios();
        return lista;
    }
    @PostMapping(value="usuario")
    public void registrarUsuario(@RequestBody Usuario usuario) {
        System.out.println("usuario: "+usuario);

        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2i);
        String hash = argon2.hash(1, 1024, 1, usuario.getPassword());
        usuario.setPassword(hash);

        ud.registrar(usuario);
    }



    @DeleteMapping(value="usuario/{id}")
    public void apagar(@RequestHeader(value="Authorization") String token, @PathVariable Long id) {

        if (!validarToken(token)) { return;}

        ud.eliminar(id);

    }

    
    @GetMapping(value="/listautils")
	public String getAllUtils(ModelMap model) {
		List<Usuario> lista = utilService.findAll();
		model.addAttribute("lista", lista);
		return "listaUtils";
	}
    
    @GetMapping(value="/create")
    public String create(ModelMap model) {
    	model.put("enumValues", ProfileEnum.values());
    	return "createUser";
    }
    
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
	public ResponseEntity<Boolean> registaUtil(@RequestBody Usuario util) {
    	if (util.getPhoto() == null && util.getId() != null) {
			Optional<Usuario> util2 = utilService.getUsuarioById(util.getId());
			if (util2.get() != null && util2.get().getPhoto()!= null) {
				Usuario user = util2.get(); 
				util.setPhoto(user.getPhoto());
				util.setData(user.getData());
			}
		}
    	
    	if (util.getId() == null || util.getId()==0) {
			util.setData(LocalDateTime.now());
		}
    	
    	utilService.create(util);
		
		return new ResponseEntity(true, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable Long id) {
    	Optional<Usuario> util = utilService.getUsuarioById(id);
    	if (util.get() != null) {
    		model.put("util", util.get());
    	}

		model.put("enumValues", ProfileEnum.values());
		return "createUser";
	}
    
}

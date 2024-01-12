package com.example.teste3.controllers;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.teste3.dao.ContactDao;
import com.example.teste3.dao.MenuDao;
import com.example.teste3.dao.ProductDao;
import com.example.teste3.models.Contact;
import com.example.teste3.models.Menu;
import com.example.teste3.models.Product;
import com.example.teste3.models.enums.ProfileEnum;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.services.EmailService;
import com.example.teste3.utils.Tuplo;

import jakarta.annotation.security.RolesAllowed;


@Controller
public class AdminController {

	private static final  Logger logger = Logger.getLogger(AdminController.class.getName());
	
	@Autowired
	private MenuDao md;

	@Autowired
	private ProductDao ud;

	@Autowired
    EmailService emailService;
	
	
	@Autowired
	ContactDao cd;
	
//	@GetMapping("/login")
//	public String login() {
//		return "login"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
//	}
//
//	@RolesAllowed("ADMIN")
//	@GetMapping("/login2")
//	public String login2() {
//		return "login2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
//	}
//	
//
//	@GetMapping("/login3")
//	public String login3() {
//		return "login3"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
//	}
//
//	@GetMapping("/login4")
//	public String login4() {
//		return "login4"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
//	}

	@GetMapping("/admin")
	public String home(ModelMap model) {

		List<Product> prods = ud.getProducts(1, 0);

		List<Tuplo> ltp = ud.getProductsByCategory(null);
		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));

		List<Menu> lista = md.getItems();
		for (Menu m : lista) {
			if (itemMap.get(m.getId()) != null) { 
				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
			}
		}
		model.put("menu", lista);

		logger.info("tam: "+prods.size());
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", 1);
		model.put("subtipo", 0);

		
		List<Contact> contacts = cd.getItems();
		model.addAttribute("listacontactos", contacts);
		
		return "/admin/index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/admin/s/{tipo}/{subTipo}")
	public String home3(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {

		List<Product> prods = ud.getProducts(tipo, idSubTipo);

		List<Tuplo> ltp = ud.getProductsByCategory(null);
		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));

		List<Menu> lista = md.getItems();
		for (Menu m : lista) {
			if (itemMap.get(m.getId()) != null) { 
				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
			}
		}
		model.put("menu", lista);

		logger.info("tam: "+prods.size());
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);

		
		List<Contact> contacts = cd.getItems();
		model.addAttribute("listacontactos", contacts);
		
		return "/admin/index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	
//	@GetMapping("/menu2")
//	public String homeMEnu() {
//		return "menu2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
//	}

	@GetMapping("/admin/roupa/{tipo}/{subTipo}")
	public String home2(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {
		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo);
		model.addAttribute("listaprodutos", prods);

		List<Tuplo> ltp = ud.getProductsByCategory(true);
		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));

		List<Menu> lista = md.getItems();
		for (Menu m : lista) {
			if (itemMap.get(m.getId()) != null) 
				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
		}
		model.put("menu", lista);

		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);
		return "/admin/roupa"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}



	@GetMapping("/admin/roupaAdmin/{tipo}/{subTipo}")
	public String homeAdmin(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {
		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo);
		model.addAttribute("listaprodutos", prods);

		List<Tuplo> ltp = ud.getProductsByCategory(true);
		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));

		List<Menu> lista = md.getItems();
		for (Menu m : lista) {
			if (itemMap.get(m.getId()) != null){
				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
			}
		}
		model.put("menu", lista);

		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);

		return "admin/roupaAdmin"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/admin/roupa2")
	public String home2(ModelMap model) {
		List<Product> prods = ud.getProducts();
		/*
		 * for(Product p: prods) {
		 * p.setDadosImagem("data:image/png;base64,"+p.getDadosImagem()); }
		 */

		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		return "roupa"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	
	@GetMapping("/admin/createAd2")
	public String criarAd2(ModelMap model) {
		// model.addAttribute("enumValues", TipoEnum.values());
		model.put("enumValues", TipoEnum.values());

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		return "/admin/createAd2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	
	@GetMapping("/admin/createAd")
	public String criarAd(ModelMap model) {
		// model.addAttribute("enumValues", TipoEnum.values());
		model.put("enumValues", TipoEnum.values());

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		return "/admin/createAd"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@DeleteMapping(value = "/admin/deleteAd/{id}")
	public ResponseEntity<Boolean> deleteAd(@PathVariable Long id) {
		ud.delete(id);
		return new ResponseEntity(true, HttpStatus.OK);
	}

	@RequestMapping(value = "/admin/editAd/{id}", method = RequestMethod.GET)
	public String editAd(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		if (prod.getTipo().getCode()>1) {
			TipoEnum te = TipoEnum.toEnum(prod.getTipo().getCode() - 1);
			prod.setTipo(te);
		}
		
		model.put("prod", prod);

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		model.put("enumValues", TipoEnum.values());
		return "/admin/createAd";
	}

	@RequestMapping(value = "/admin/editAd2/{id}", method = RequestMethod.GET)
	public String editAd2(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		/*TipoEnum te = TipoEnum.toEnum(prod.getTipo().getCode() - 1);
		prod.setTipo(te); */
		model.put("prod", prod);

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		model.put("enumValues", TipoEnum.values());
		return "/admin/createAd2";
	}

	@RequestMapping(value = "/admin/show/{id}", method = RequestMethod.GET)
	public String showPhoto(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		model.put("prod", prod);
		return "/admin/mostra";
	}

	@GetMapping("/admin/roupaAdminMenu/{tipo}/{subTipo}")
	public String homeAdmin2(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {
		List<Product> prods = ud.getProducts(tipo, idSubTipo);
		model.addAttribute("listaprodutos", prods);

		List<Tuplo> ltp = ud.getProductsByCategory(null);
		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));

		List<Menu> lista = md.getItems();
		for (Menu m : lista) {
			if (itemMap.get(m.getId()) != null) {
				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
			}
		}
		model.put("menu", lista);

		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);

		return "/admin/roupaAdminMenu"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}


}

package com.example.teste3.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.teste3.dao.ContactDao;
import com.example.teste3.models.Contact;
import com.example.teste3.models.Email;
import com.example.teste3.models.Menu;
import com.example.teste3.models.Product;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.repository.ContactRepository;
import com.example.teste3.services.ContactService;
import com.example.teste3.services.EmailService;

@Controller
@RequestMapping("/contacts")
public class ContactController {

	@Autowired
	private ContactDao cd;

	@Autowired
	private ContactRepository cr;
	
	@Autowired
	private ContactService contactService;
	
	@Autowired
    private EmailService emailService;
	
	
	@GetMapping(value="/newcontact")
	public String newContacto() {
		return "newcontact";
	}
	
	@GetMapping(value="/lista")
	public String list(ModelMap model) {
		List<Contact> lista = cd.getItems();
		model.addAttribute("contactos", lista);
		return "lista";
	}

	@RequestMapping(value="/create", method = RequestMethod.POST)
	public ResponseEntity<Boolean> registaContacto(@RequestBody Contact contacto, @RequestParam(defaultValue = "false") Boolean email) {
		
		if (contacto.getPai().getId() !=null) {
			Contact pai = cd.getContact(contacto.getPai().getId());
			contacto.setPai(pai);
			contacto.setNome(pai.getNome());
			contacto.setEmail(pai.getEmail());
			contacto.setUser(pai.getUser());
		}
		
		if (email) {
			Email emailModel = new Email();
			emailModel.setOwnerRef("nelson"); // Talvez username !!
			emailModel.setEmailFrom("raul@gmail.com");
			emailModel.setEmailTo(contacto.getEmail());
			emailModel.setSubject(contacto.getAssunto());
			emailModel.setText(contacto.getDescricao());
			enviarEmail(emailModel);
			
			contacto.setMail(emailModel);
		}
		

		
		if (contacto.getId() == null || contacto.getId() == 0) {
			contacto.setData(LocalDateTime.now());
			contacto.setActivo(true);
		}
		
		cd.registar(contacto);
		
		return new ResponseEntity(true, HttpStatus.OK);
		
	}
	
	private void enviarEmail(Email email) {
		email.setOwnerRef("nelson"); // Talvez username !!
        email.setEmailFrom("raul@gmail.com");
        //email.setEmailTo("nelsonpovoa@gmail.com");
        
        //BeanUtils.copyProperties(emailDto, emailModel);
        emailService.sendEmail(email);
		
	}

	private Sort.Direction getSortDirection(String direction) {
		if (direction.equals("asc")) {
			return Sort.Direction.ASC;
		} else if (direction.equals("desc")) {
			return Sort.Direction.DESC;
		}

		return Sort.Direction.ASC;
	}
	

	@GetMapping("/listacontactos")
	public String getAllContacts(Model model, 
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size,
			@RequestParam(required = false) String name, @RequestParam(defaultValue = "id,desc") String[] sort) {

		try {

			List<Order> orders = new ArrayList<Order>();

			if (sort[0].contains(",")) {
				// will sort more than 2 fields
				// sortOrder="field, direction"
				for (String sortOrder : sort) {
					String[] _sort = sortOrder.split(",");
					orders.add(new Order(getSortDirection(_sort[1]), _sort[0]));
				}
			} else {
				// sort=[field, direction]
				orders.add(new Order(getSortDirection(sort[1]), sort[0]));
			}
			
			Stream stream = Stream.of(3, 6, 10);
			String[] listaPageSize = new String[]{"5" , "10", "20", "50", "100"};
			
			List<Contact> contactos = new ArrayList<Contact>();
			Pageable paging = PageRequest.of(page - 1, size, Sort.by(orders));

			Page<Contact> pageTuts;
			if (name == null) {
				//pageTuts = cr.findAll(paging);
				//pageTuts = contactService.getContacts(true, null, "", paging);
				pageTuts = cr.findByPai(null, paging);
				
			} else {
				pageTuts = cr.findByNomeContainingIgnoreCase(name, paging);
				model.addAttribute("name", name);
			}

			contactos = pageTuts.getContent();

			
			model.addAttribute("listacontactos", contactos);
			model.addAttribute("currentPage", pageTuts.getNumber() + 1);
			model.addAttribute("totalItems", pageTuts.getTotalElements());
			model.addAttribute("totalPages", pageTuts.getTotalPages());
			model.addAttribute("pageSize", size);
			model.addAttribute("listaPageSize", listaPageSize);
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
		}

		return "contacts";
	}

	@GetMapping(value="/listacontactos2")
	public String getAllContacts2(ModelMap model) {
		List<Contact> lista = cd.getItems();
		model.addAttribute("contactos", lista);
		return "contacts2";
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap model, @PathVariable Long id) {
		Contact contactoPAi = cd.getContact(id); // primeiro contacto
		
		List<Contact> cts = cd.getAllContactsByIdPai(id);

		model.put("contactos", cts);
		model.put("contactoPAi", contactoPAi);

		return "contacto";
	}
	

	@PostMapping("/sending-email")
    public ResponseEntity<Boolean> sendingEmail(@RequestBody Email email) { //@RequestBody @Valid EmailDto emailDto
        //Email emailModel = new Email();
        email.setOwnerRef("nelson"); // Talvez username !!
        email.setEmailFrom("raul@gmail.com");
        email.setEmailTo("nelsonpovoa@gmail.com");
        
        //BeanUtils.copyProperties(emailDto, emailModel);
        emailService.sendEmail(email);
        
        return new ResponseEntity(true, HttpStatus.CREATED);
    }
}

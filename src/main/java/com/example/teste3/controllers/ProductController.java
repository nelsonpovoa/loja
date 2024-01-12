package com.example.teste3.controllers;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.teste3.dao.MenuDao;
import com.example.teste3.dao.ProductDao;
import com.example.teste3.models.Menu;
import com.example.teste3.models.Product;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.repository.ProductRepository;
import com.example.teste3.services.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	public static final Logger LOG = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductDao ud;
	
	@Autowired
	private MenuDao md;

	@Autowired
	private ProductRepository pr;

	@Autowired
	private ProductService productService;

	public String percentBase64(String in_image) throws IOException
	{

		String imageData = in_image;
	
		//convert the image data String to a byte[]
		byte[] dta = DatatypeConverter.parseBase64Binary(imageData);
		try (InputStream in = new ByteArrayInputStream(dta);) {
		    BufferedImage fullSize = ImageIO.read(in);
	
		    // Create a new image .7 the size of the original image
			double newheight_db = fullSize.getHeight() * .1;
			double newwidth_db = fullSize.getWidth() * .1;
				
		    int newheight = (int)newheight_db;
		    int newwidth = (int)newwidth_db;
	
		    BufferedImage resized = new BufferedImage(newwidth, newheight, BufferedImage.SCALE_REPLICATE);
	
		    Graphics2D g2 = (Graphics2D) resized.getGraphics();
		    g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
	
		    //draw fullsize image to resized image
		    g2.drawImage(fullSize, 0, 0, newwidth, newheight, null);
	
		    try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
		        ImageIO.write( resized, "png", baos );
		        baos.flush();
		       byte[] resizedInByte = baos.toByteArray();
		 // Base64Encoder enc_resized = new Base64Encoder();
		  
		       String out_image = Base64.getEncoder().encodeToString(resizedInByte);
		  
		 //String out_image = enc_resized.encode(resizedInByte);
	
		    return out_image;
		    }
		}
	}
	
	private void resizeImages(List<Product> prods) throws IOException {
		for (Product p : prods) {
			String imagem = p.getDadosImagem();
			
			String img2 = imagem.substring(imagem.indexOf(",")+1); //imagem.substring(22);
			byte[] bytes = img2.getBytes();
			   
	        
	        String b64Resize3 = percentBase64(img2);
	        
	        
	        p.setThumbnailImage("data:image/png;base64,"+b64Resize3);
	        
	        System.out.println("imagem: "+p.getName()+" orig: "+bytes.length+" resize: "+b64Resize3.length());
		}
	}
	
	
	@GetMapping(value="/listaprodutos")
	public String list(ModelMap model) throws IOException {
		List<Product> prods = ud.getProducts();
		resizeImages(prods);
		
		model.addAttribute("listaprods", prods);
		return "products";
	}

	//@PostMapping(value="/createAd")
	@RequestMapping(value="/createAd", method = RequestMethod.POST)
	public ResponseEntity<Boolean> registaProduto(@RequestBody Product prod) {
		/*TipoEnum te = TipoEnum.toEnum(prod.getTipo().getCode()-1);
		prod.setTipo(te);*/

		
		if (prod.getDadosImagem() == null && prod.getId() != null) {
			Product prod2 = ud.getProduto(prod.getId());
			prod.setDadosImagem(prod2.getDadosImagem());
			prod.setDataCriacao(prod2.getDataCriacao());
		}
		
		if (prod.getId() != null) {
			Product prod2 = ud.getProduto(prod.getId());
			prod.setDataCriacao(prod2.getDataCriacao());
		}
		
		if (prod.getId() == null || prod.getId()==0) {
			prod.setDataCriacao(LocalDateTime.now());
		}
		
		ud.registar(prod);
		
		return new ResponseEntity(true, HttpStatus.OK);
		
	}

	/*
	@GetMapping("/createAd2")
	public String criarAd(ModelMap model) {
		model.addAttribute("enumValues", TipoEnum.values());
		return "createAd"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}*/

	@GetMapping("/enum")
	public String enumPage(Model model) {
		model.addAttribute("enumValues", TipoEnum.values());
		return "enumPage";
	}

	@RequestMapping(value="/show/{id}", method = RequestMethod.GET)
	public String showPhoto(ModelMap model,@PathVariable Long id) {
		Product prod = ud.getProduto(id);
		
		List<Menu> lista = md.getItems();
		model.put("menu", lista);
		
		model.put("prod", prod);
		return "mostra";
	}
	
	@RequestMapping(value = "/editAd/{id}", method = RequestMethod.GET)
	public String editAd(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		/*if (prod.getTipo().getCode()>1) {
			TipoEnum te = TipoEnum.toEnum(prod.getTipo().getCode() - 1);
			prod.setTipo(te);
		}*/
		model.put("prod", prod);

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		model.put("enumValues", TipoEnum.values());
		
		return "createAd2";
	}
	
	@GetMapping("/listaprodutos2")
	public String listaprods(ModelMap model) throws IOException {
		List<Product> prods = ud.getProducts();
		resizeImages(prods);
		
		/*for (Product p : prods) {
			if (p.getTipo().getCode() > 1) {
				TipoEnum te = TipoEnum.toEnum(p.getTipo().getCode() - 1);
				p.setTipo(te);
			}
		}*/
		
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprods", prods);
		model.put("enumValues", TipoEnum.values());
		return "products2";
	}
	
	private Sort.Direction getSortDirection(String direction) {
		if (direction.equals("asc")) {
			return Sort.Direction.ASC;
		} else if (direction.equals("desc")) {
			return Sort.Direction.DESC;
		}

		return Sort.Direction.ASC;
	}

	@GetMapping("/products4")
	public ResponseEntity<Map<String, Object>> getAllProductsPage(Model model,
			@RequestParam(required = false) String title, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "3") int size, @RequestParam(defaultValue = "id,desc") String[] sort) {

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

			List<Product> tutorials = new ArrayList<Product>();
			Pageable pagingSort = PageRequest.of(page, size, Sort.by(orders));

			Page<Product> pageTuts;
			if (title == null) {
				pageTuts = pr.findAll(pagingSort);
			} else {
				pageTuts = pr.findByNameContaining(title, pagingSort);
			}

			tutorials = pageTuts.getContent();

			if (tutorials.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			Map<String, Object> response = new HashMap<>();
			response.put("tutorials", tutorials);
			response.put("currentPage", pageTuts.getNumber());
			response.put("totalItems", pageTuts.getTotalElements());
			response.put("totalPages", pageTuts.getTotalPages());
			response.put("pageSize", size);

			return new ResponseEntity<>(response, HttpStatus.OK);
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/listaprodutos3")
	public String getAllProductsPage3(Model model, 
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size,
			@RequestParam(required = false) String name, 
			@RequestParam(required = false) String categorias,
			@RequestParam(defaultValue = "id,desc") String[] sort) {

		try {


			Stream stream = Stream.of(3, 6, 10);
			String[] listaPageSize = new String[]{"5" , "10", "20", "50", "100"};
			
			List<Product> prods = new ArrayList<Product>();
			Pageable paging = PageRequest.of(page - 1, size);

			Page<Product> pageTuts;
			if (name == null && categorias == null) {
				pageTuts = pr.findAll(paging);
				
			} else if (name != null && categorias == null){
				pageTuts = pr.findByNameContainingIgnoreCase(name, paging);
				//model.addAttribute("name", name);
			}else {
				List<Integer> str = Arrays.stream(categorias.split(",")) .map(Integer::parseInt).toList(); 
				if (name == null) name="";
				pageTuts = pr.findByNameContainingIgnoreCaseAndSubTipoIn(name, str, paging);
				//model.addAttribute("name", name);
				//model.addAttribute("subTipo", categorias);
			}

			prods = pageTuts.getContent();
			resizeImages(prods);
			
			
//			for (Product p : prods) {
//				if (p.getTipo().getCode() > 1) {
//					TipoEnum te = TipoEnum.toEnum(p.getTipo().getCode() - 1);
//					p.setTipo(te);
//				}
//			}
			
			// MENU
			List<Menu> lista = md.getItems();
			model.addAttribute("menu", lista);
			
			model.addAttribute("name", name);
			model.addAttribute("categorias", categorias);
			
			model.addAttribute("listaprods", prods);
			model.addAttribute("currentPage", pageTuts.getNumber() + 1);
			model.addAttribute("totalItems", pageTuts.getTotalElements());
			model.addAttribute("totalPages", pageTuts.getTotalPages());
			model.addAttribute("pageSize", size);
			model.addAttribute("listaPageSize", listaPageSize);
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
		}

		return "products3";
	}

	@GetMapping("/products2")
	public ResponseEntity<List<Product>> getAllProducts(@RequestParam(defaultValue = "0") Integer pageNo,
			@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "id") String sortBy) {

		List<Product> list = productService.getAllProducts(pageNo, pageSize, sortBy);

		return new ResponseEntity<List<Product>>(list, new HttpHeaders(), HttpStatus.OK);
	}
	
	@GetMapping("/atualizaNovidade/{id}/{val}")
	public ResponseEntity<Boolean> atualizaNovidade(@PathVariable Long id, @PathVariable Boolean val) {
		Boolean res = ud.actualizaNovidade(id, val);
		return new ResponseEntity(res, HttpStatus.OK);
	}
	
	@GetMapping("/atualizaActivo/{id}/{val}")
	public ResponseEntity<Boolean> atualizaActivo(@PathVariable Long id, @PathVariable Boolean val) {
		Boolean res = ud.actualizaActivo(id, val);
		return new ResponseEntity(res, HttpStatus.OK);
	}
}

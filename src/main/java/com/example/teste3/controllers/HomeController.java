package com.example.teste3.controllers;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yaml.snakeyaml.external.biz.base64Coder.Base64Coder;

import com.example.teste3.dao.ContactDao;
import com.example.teste3.dao.MenuDao;
import com.example.teste3.dao.ProductDao;
import com.example.teste3.models.Contact;
import com.example.teste3.models.Menu;
import com.example.teste3.models.Product;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.services.EmailService;
import com.example.teste3.utils.Tuplo;

import jakarta.annotation.security.RolesAllowed;


@Controller
public class HomeController {

	private static final  Logger logger = Logger.getLogger(HomeController.class.getName());

	
	public static final class ImagensEventos {
		public static short MENU = 1;
		public static short TOP = 2;
		public static short BOTTOM = 3;
		public static short POPUP = 4;
		
		public static short NONE = 0;
		public static short NATAL  = 4;
		public static short PASCOA = 2;
		
		short evento;
		short pos;
		
		public ImagensEventos(short pos, short evento) {
			this.pos = pos;
			this.evento = evento;
		}
		
		public String getImagem() {
			short minimum = 0;

			if (evento == NATAL) {
				String path = "/img/christmas/";
				
				if (pos == TOP) {
				
					String[] imagens = {"balls-and-bell3.png", 
							"sinos-de-natal-e-abetos2.png", 
							"bola-decoracao2.png",
							"santa-claus-christmas2.png"}; 
					short maximum = (short)imagens.length;
					
					int val = minimum + new Integer((short)(Math.random() * maximum)).shortValue();
					
					return path+imagens[val];
					
				}else if (pos == MENU) {
					String[] imagens = {"ramo-e-neve-flex3.png", 
							"genere-noel-houx2.png",
							"christmas-decoration-with-fir-and-balls2.png"};
					short maximum = (short)imagens.length;
					
					int val = minimum + new Integer((short)(Math.random() * maximum)).shortValue();
					
					return path+imagens[val];
				}else if (pos == BOTTOM) {
					String[] imagens = {"element-balls2.png"
							};
					short maximum = (short)imagens.length;
					
					int val = minimum + new Integer((short)(Math.random() * maximum)).shortValue();
					
					return path+imagens[val];
				}else if (pos == POPUP) {
					String[] imagens = {"quadro-de-midia-social-de-natal-png-com-folhas-de-pinheiro2.png"
					};
					short maximum = (short)imagens.length;
					
					int val = minimum + new Integer((short)(Math.random() * maximum)).shortValue();
					
					return path+imagens[val];
				}
			}
			
			return "";
		}
	}
	
	
	@Autowired
	private MenuDao md;

	@Autowired
	private ProductDao ud;

	@Autowired
    EmailService emailService;
	
	
	@Autowired
	ContactDao cd;
	
	@GetMapping("/login")
	public String login() {
		return "login"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@RolesAllowed("ADMIN")
	@GetMapping("/login2")
	public String login2() {
		return "login2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	

	@GetMapping("/login3")
	public String login3() {
		return "login3"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/login4")
	public String login4() {
		return "login4"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/login7")
	public String login7() {
		return "login7"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	
	
	
	   public static BufferedImage Base64ToBufferImage(String base64) {
	        BufferedImage image = null;
	        byte[] imageBytes;
	        imageBytes = Base64.getDecoder().decode(base64);
	        try (ByteArrayInputStream bis = new ByteArrayInputStream(imageBytes)) {
	            image = ImageIO.read(bis);
	        } catch (IOException ex) {
	            //log.error("read  image error", ex);
	        }
	        return image;
	    }
	   
	   
	   public static String bufferImageToBase64(BufferedImage image, String format) throws IOException {
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        javax.imageio.ImageIO.write(image, format, baos);
	        byte[] bytes = baos.toByteArray();
	        String base64 = Base64.getEncoder().encodeToString(bytes);
	        return base64;
	    }
	   
	   private static void saveImage(String base64Image, String imagePath) {
	        try {
	            byte[] imageBytes = Base64Coder.decode(base64Image);
	            File imageFile = new File(imagePath);
	            if (!imageFile.exists()) {
	                imageFile.createNewFile();
	            }
	            FileOutputStream outputStream = new FileOutputStream(imageFile);
	            outputStream.write(imageBytes);
	            outputStream.flush();
	            outputStream.close();
	            System.out.println("save success：" + imagePath);
	        } catch (Throwable e) {
	        	e.printStackTrace();
	        	logger.info("save file failed: "+e.getMessage());
	        }
	    }
	   
//	   public static void init(String user, String passwd) throws ApiException{
//			String encodedString = Base64.getEncoder().encodeToString("algaworks:123".getBytes());
//
//			String strToken = api.login(encodedString, user, passwd);
//			JsonParser parser = new JsonParser();
//
//			String token = parser.parse(strToken).getAsJsonObject().get("access_token").getAsString();
//			System.out.println(token);
//			setAccessToken(token);
//
//
//		}

	   
		@GetMapping("/loja")
		public String homeLoja(ModelMap model, RedirectAttributes redirectAttributes, Authentication authentication) throws IOException {

			if (authentication != null) {
				//String password = authentication.getCredentials().toString();
				String password = ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getPassword();
				String username = ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getUsername();
			}
			
			
			List<Product> prods = ud.getProductsActivos(0, 0);
			resizeImages(prods);
			
			
			List<Tuplo> ltp = ud.getProductsByCategory(true);
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
			model.addAttribute("tipo", 0);
			model.addAttribute("subtipo", 0);

			
			List<Contact> contacts = cd.getItems();
			model.addAttribute("listacontactos", contacts);
			
			return "public/index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
		}	   
	   
	   
	@GetMapping("/")
	public String home(ModelMap model, RedirectAttributes redirectAttributes, Authentication authentication) throws IOException {

		if (authentication != null) {
			//String password = authentication.getCredentials().toString();
			String password = ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getPassword();
			String username = ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getUsername();
		}
		
		List<Product> prods = ud.getProductsActivos(0, 0);
		resizeImages(prods);
		
		
		List<Tuplo> ltp = ud.getProductsByCategory(true);
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
		model.addAttribute("tipo", 0);
		model.addAttribute("subtipo", 0);

		
		List<Contact> contacts = cd.getItems();
		model.addAttribute("listacontactos", contacts);
		
		return "public/index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	 private static final int IMG_WIDTH = 200;
	    private static final int IMG_HEIGHT = 200;
	    
	private static BufferedImage resizeImage(BufferedImage originalImage, int type) {
        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();

        return resizedImage;
    }
	
	
	public String SeventyPercentBase64(String in_image) throws IOException
	{

	String imageData = in_image;

	//convert the image data String to a byte[]
	byte[] dta = DatatypeConverter.parseBase64Binary(imageData);
	try (InputStream in = new ByteArrayInputStream(dta);) {
	    BufferedImage fullSize = ImageIO.read(in);

	    // Create a new image .7 the size of the original image
	  double newheight_db = fullSize.getHeight() * .3;
	  double newwidth_db = fullSize.getWidth() * .3;

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
			
//			BufferedImage resizedIdPhoto2 = Base64ToBufferImage(img2); //new BufferedImage(300, 400, BufferedImage.TYPE_INT_ARGB);
//			BufferedImage thumbnail = Thumbnails.of(resizedIdPhoto2)
//	        .size(160, 160)
//			//.scale(0.50)
//	        .asBufferedImage();
//			
//			Graphics2D graphics2 = resizedIdPhoto2.createGraphics();
//	        //BufferedImage img3 = Base64ToBufferImage(img2);
//	        graphics2.drawImage(thumbnail, 0, 0, 300, 400, null);
//	        //"data:image/png;base64,"+
//	        String b64Resize2 = bufferImageToBase64(resizedIdPhoto2, "png");

			// --------------------------------------------
			
			
//			try {
//	            BufferedImage image = ImageIO.read(new ByteArrayInputStream(imagem.getBytes()));
//	            resizeImage(image, image.getType());
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
			
			
			// --------------------------
			
			
			
			
			//byte[] bytes = img2.getBytes();
	        //String base64Origin = Base64.getEncoder().encodeToString(bytes);
//	        BufferedImage resizedIdPhoto = new BufferedImage(300, 400, BufferedImage.TYPE_INT_ARGB);
//	        Graphics2D graphics = resizedIdPhoto.createGraphics();
//	        BufferedImage img = Base64ToBufferImage(img2);
//	        graphics.drawImage(img, 0, 0, 300, 400, null);
	        //"data:image/png;base64,"+
//	        String b64Resize = bufferImageToBase64(resizedIdPhoto, "png");
	        //saveImage(img2,"c:/share/tmp10/"+p.getId()+"_hr-origin.png");
	        //saveImage(b64Resize,"c:/share/tmp10/"+p.getId()+"__hr-origin.jpeg");
	        
	        
	        String b64Resize3 = SeventyPercentBase64(img2);
	        
	        
	        p.setThumbnailImage("data:image/png;base64,"+b64Resize3);
	        
	        System.out.println("imagem: "+p.getName()+" orig: "+bytes.length+" resize: "+b64Resize3.length());
		}
	}

	@GetMapping("/s/{tipo}/{subTipo}")
	public String home3(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) throws IOException {

		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo);
		resizeImages(prods);
		
		List<Tuplo> ltp = ud.getProductsByCategory(true);
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
		model.addAttribute("tipo", tipo);
		model.addAttribute("subtipo", idSubTipo);

		
		List<Contact> contacts = cd.getItems();
		model.addAttribute("listacontactos", contacts);
		
		return "public/index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	
	
	
	
	@GetMapping("/s/ordenacao/{tipo}/{subTipo}/{ordenacao}/{vista}")
	public String home4(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, 
			@PathVariable("ordenacao") short ordenacao, 
			@PathVariable("vista") short vista, ModelMap model) throws IOException {

		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo, ordenacao);
		resizeImages(prods);
		
//		List<Tuplo> ltp = ud.getProductsByCategory(true);
//		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));
//
//		List<Menu> lista = md.getItems();
//		for (Menu m : lista) {
//			if (itemMap.get(m.getId()) != null) { 
//				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
//			}
//		}
//		model.put("menu", lista);

		logger.info("tam: "+prods.size());
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);
		model.put("vista", vista);
		
		//List<Contact> contacts = cd.getItems();
		//model.addAttribute("listacontactos", contacts);
		
		if (vista <= 1) {
			return "public/lista-anuncios"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
		}else {
			return "lista-anuncios-vista2";
		}
	}
	
	
	@PostMapping("/pesqpornome")
	public String pesquisa(@RequestParam("tipo") short tipo, @RequestParam("subTipo") short idSubTipo, 
			@RequestParam("fieldPesq") short fieldPesq, @RequestParam("field") String field, 
			@RequestParam("ordenacao")short ordenacao, 
			@RequestParam("vista") short vista, ModelMap model) throws IOException {
		
		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo, ordenacao, fieldPesq, field);
		resizeImages(prods);
		
//		List<Tuplo> ltp = ud.getProductsByCategory(true);
//		Map<Long, Tuplo> itemMap = ltp.stream().collect(Collectors.toMap(Tuplo::getIdMenu, item -> item));
//
//		List<Menu> lista = md.getItems();
//		for (Menu m : lista) {
//			if (itemMap.get(m.getId()) != null) { 
//				m.setNumProducts((itemMap.get(m.getId()).getNumProducts()));
//			}
//		}
//		model.put("menu", lista);

		logger.info("tam: "+prods.size());
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		model.put("tipo", tipo);
		model.put("subtipo", idSubTipo);
		model.put("vista", vista);
		
		//List<Contact> contacts = cd.getItems();
		//model.addAttribute("listacontactos", contacts);
		
		if (vista <= 1) {
			return "public/lista-anuncios"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
		}else {
			return "lista-anuncios-vista2";
		}
	}
	
	
	@PostMapping("/search-all-site")
	public String pesquisa(
			@RequestParam("fieldPesq") short fieldPesq, @RequestParam("value") String value, 
			@RequestParam("ordenacao")short ordenacao, 
			@RequestParam("vista") short vista, ModelMap model) throws IOException {
		
		List<Product> prods = ud.getProductsActivos((short)0, (short)0, ordenacao, fieldPesq, value);
		resizeImages(prods);


		logger.info("tam: "+prods.size());
		// System.out.println("tam: "+prods.size());
		model.addAttribute("listaprodutos", prods);
		//model.put("tipo", tipo);
		//model.put("subtipo", idSubTipo);
		model.put("vista", vista);
		
		//List<Contact> contacts = cd.getItems();
		//model.addAttribute("listacontactos", contacts);
		
		if (vista <= 1) {
			return "public/lista-anuncios"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
		}else {
			return "lista-anuncios-vista2";
		}
	}
	
	
	@GetMapping("/menu2")
	public String homeMEnu() {
		return "menu2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/roupa/{tipo}/{subTipo}")
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
		return "roupa"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	// public String homeSB(@RequestParam(value = "tipo", required = false) int
	// tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {
	@GetMapping("/roupasb/{tipo}/{subTipo}")
	public String homeSB(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) {
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
		
		// System.out.println("menu: "+lista);
		return "index"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/roupaAdmin/{tipo}/{subTipo}")
	public String homeAdmin(@PathVariable int tipo, @PathVariable("subTipo") int idSubTipo, ModelMap model) throws IOException {
		List<Product> prods = ud.getProductsActivos(tipo, idSubTipo);
		resizeImages(prods);
		
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

		return "roupaAdmin"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@GetMapping("/roupa2")
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

	
	@GetMapping("/createAd2")
	public String criarAd2(ModelMap model) {
		// model.addAttribute("enumValues", TipoEnum.values());
		model.put("enumValues", TipoEnum.values());

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		return "createAd2"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}
	
	@GetMapping("/createAd")
	public String criarAd(ModelMap model) {
		// model.addAttribute("enumValues", TipoEnum.values());
		model.put("enumValues", TipoEnum.values());

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		return "createAd"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}

	@DeleteMapping(value = "/deleteAd/{id}")
	public ResponseEntity<Boolean> deleteAd(@PathVariable Long id) {
		ud.delete(id);
		return new ResponseEntity(true, HttpStatus.OK);
	}

	@RequestMapping(value = "/editAd/{id}", method = RequestMethod.GET)
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
		return "createAd";
	}

	@RequestMapping(value = "/editAd2/{id}", method = RequestMethod.GET)
	public String editAd2(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		/*TipoEnum te = TipoEnum.toEnum(prod.getTipo().getCode() - 1);
		prod.setTipo(te); */
		model.put("prod", prod);

		List<Menu> lista = md.getItems();
		model.put("menu", lista);

		model.put("enumValues", TipoEnum.values());
		return "createAd2";
	}

	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	public String showPhoto(ModelMap model, @PathVariable Long id) {
		Product prod = ud.getProduto(id);

		model.put("prod", prod);
		return "mostra";
	}

	@GetMapping("/roupaAdminMenu/{tipo}/{subTipo}")
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

		return "roupaAdminMenu"; // O nome "index" corresponde ao nome do arquivo JSP sem a extensão
	}


}

package com.example.teste3.dao;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Product;
import com.example.teste3.models.Usuario;
import com.example.teste3.utils.Tuplo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Product> getProducts() {
        String query ="From Product";

        return em.createQuery(query).getResultList();

    }

    @Override
    public void eliminar(Long id) {
        Usuario u = em.find(Usuario.class, id);
        em.remove(u);
    }

    @Override
    public void registar(Product prod) {
    	if (prod.getId()== null || prod.getId()==0) {
    		em.persist(prod);
    	}else {
    		em.merge(prod);
    	}
    }

	@Override
	public List<Product> getProducts(int tipo, int idSubTipo) { // :tipo
		String query ="";
		if (tipo == 0 && idSubTipo==0) {
			query ="From Product where novidade = true order by id";
		}else {
			query ="From Product where "+(tipo >0 ? "tipo = "+tipo : "subTipo = "+idSubTipo)+" order by id";
		}

		//TipoEnum t = TipoEnum.get
		//System.out.println("query: "+query);
        return em.createQuery(query).getResultList(); //setParameter("tipo", tipo).

	}

	@Override
	public List<Product> getProductsActivos(int tipo, int idSubTipo) { // :tipo
		String query ="";
		if (tipo == 0 && idSubTipo==0) {
			query ="From Product where activo=true and novidade = true order by id";
		}else {
			query ="From Product where activo=true and "+(tipo >0 ? "tipo = "+tipo : "subTipo = "+idSubTipo)+" order by id";
		}

		//TipoEnum t = TipoEnum.get
		//System.out.println("query: "+query);
        return em.createQuery(query).getResultList(); //setParameter("tipo", tipo).

	}
	
	@Override
	public void delete(Long id) {
		Product p = em.find(Product.class, id);
		em.remove(p);
	}

	@Override
	public Product getProduto(Long id) {
		return em.find(Product.class, id);
	}

	@Override
	public List<Tuplo> getProductsByCategory(Boolean activos) {
		String query = "select m1.id, m1.descricao, count(p.id), "
				+ "(select count(*) from Product p2 where p2.subTipo = m1.id "
				+ (activos != null ? "and p2.activo="+activos : "" )
				+ ") as countSubTipo, "
				+ "(select count(*) from Product p3 "
				+ "			   inner join Menu m3 on (p3.subTipo = m3.id) "
				+ "			   where m3.idPai = m1.id "
				+ (activos != null ? "and p3.activo="+activos : "" ) + ") as count3 "
				+ "from Menu m1 left outer join Product p on (m1.id = p.tipo "
				+ (activos != null ? "and p.activo="+activos : "" )+") "
				//+(activos != null ? "where p.activo="+activos : "" )+" "
				+ "group by 1,2 "
				+ "order by m1.id";
		System.out.println("query: "+query);
		Query q = em.createQuery(query);
		List<Object[]> aa = q.getResultList();
		
		//System.out.println("aa: "+aa);
		List<Tuplo> newList = aa.stream().map(src -> {
            Tuplo target = new Tuplo();
            //System.out.println("src: "+((Object[])src)[0]);
            target.setIdMenu(Long.parseLong(""+((Object[])src)[0]));
            target.setDescricaoMenu(""+((Object[])src)[1]);
            
            if (Integer.parseInt(""+((Object[])src)[2]) > 0) {
				target.setNumProducts(Integer.parseInt(""+((Object[])src)[2]));
			}else if (Integer.parseInt(""+((Object[])src)[3]) > 0){
				target.setNumProducts(Integer.parseInt(""+((Object[])src)[3]));
			}else {
				target.setNumProducts(Integer.parseInt(""+((Object[])src)[4]));
			}
            
            return target;
        }).collect(Collectors.toList());
		
		return newList;
	}

	@Override
	public Boolean actualizaNovidade(Long id, Boolean val) {
		Product prod = em.find(Product.class, id);
		prod.setNovidade(val);
		em.merge(prod);
		
		return true;
	}

	@Override
	public Boolean actualizaActivo(Long id, Boolean val) {
		Product prod = em.find(Product.class, id);
		prod.setActivo(val);
		em.merge(prod);
		
		return true;
	}

	@Override
	public List<Product> getProductsActivos(int tipo, int idSubTipo, short ordenacao) {
		String query ="";
		String ordem = "id";
		if (ordenacao >0) {
			if (ordenacao == 1) {
				ordem = "name";
			}else if (ordenacao == 2) {
				ordem = "dataCriacao asc";
			}else if (ordenacao == 3) {
				ordem = "dataCriacao desc";
			}else if (ordenacao == 4) {
				ordem = "preco asc";
			}else if (ordenacao == 5) {
				ordem = "preco desc";
			}
		}
		if (tipo == 0 && idSubTipo==0) {
			query ="From Product where activo=true and novidade = true order by "+ordem;
		}else {
			query ="From Product where activo=true and "+(tipo >0 ? "tipo = "+tipo : "subTipo = "+idSubTipo)+" order by "+ordem;
		}

		//TipoEnum t = TipoEnum.get
		//System.out.println("query: "+query);
        return em.createQuery(query).getResultList(); //setParameter("tipo", tipo).
	}

	
	@Override
	public List<Product> getProductsActivos(short tipo, short idSubTipo, short ordenacao, short fieldPesq, String field) {
		String query ="";
		String ordem = "id";
		if (ordenacao >0) {
			if (ordenacao == 1) {
				ordem = "nome";
			}else if (ordenacao == 2) {
				ordem = "dataCriacao asc";
			}else if (ordenacao == 3) {
				ordem = "dataCriacao desc";
			}else if (ordenacao == 4) {
				ordem = "preco asc";
			}else if (ordenacao == 5) {
				ordem = "preco desc";
			}
		}
		
		String pesquisa="";
		if (fieldPesq >0) {
			if (fieldPesq == 1) {
				pesquisa = "and lower(name) like '%"+field.toLowerCase()+"%'";
			}else if (fieldPesq == 2) {
				pesquisa = "and lower(descricao) like '%"+field.toLowerCase()+"%'";
			}else if (fieldPesq == 3) {
				pesquisa = "and lower(referencia) like '%"+field.toLowerCase()+"%'";
			}else if (fieldPesq == 4) {
				pesquisa = "and lower(marca) like '%"+field.toLowerCase()+"%'";
			}
		}else if (fieldPesq == 0 && field.length()>0) { // pesquisar em todos os campos;
			pesquisa = "and (lower(name) like '%"+field.toLowerCase()+"%' OR "+
				" lower(descricao) like '%"+field.toLowerCase()+"%' OR " +
				" lower(referencia) like '%"+field.toLowerCase()+"%' OR "+
				" lower(marca) like '%"+field.toLowerCase()+"%')";
		}
		
		if (tipo == 0 && idSubTipo==0 && field.length()==0) {
			query ="From Product where activo=true and novidade = true "+(pesquisa.length()>0 ? pesquisa: "")+" order by "+ordem;
		}else {
			query ="From Product where activo=true "+(pesquisa.length()>0 ? pesquisa: "")+" "+(tipo >0 ? " and tipo = "+tipo : (idSubTipo >0 ? " and subTipo = "+idSubTipo : ""))+" order by "+ordem;
		}

		//TipoEnum t = TipoEnum.get
		//System.out.println("query: "+query);
        return em.createQuery(query).getResultList(); //setParameter("tipo", tipo).
	}




}


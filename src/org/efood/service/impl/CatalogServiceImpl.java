package org.efood.service.impl;

import java.util.List;

import org.efood.dao.CatalogDAO;
import org.efood.service.CatalogService;
import org.efood.vo.Catalog;

public class CatalogServiceImpl implements CatalogService {
	CatalogDAO catalogDAO;
	@Override
	public List<Catalog> getCataLogList() {
		return catalogDAO.getCatalogList();
	}
	@Override
	public void saveCatalog(Catalog catalog) {
		catalogDAO.saveCatalog(catalog);
	}
	@Override
	public void updateCatalog(Catalog catalog) {
		catalogDAO.updateCatalog(catalog);
	}
	@Override
	public void deleteCatalog(Integer catalogid) {
		catalogDAO.deleteCatalog(catalogid);
	}
	
	
	
	
	public CatalogDAO getCatalogDAO() {
		return catalogDAO;
	}
	public void setCatalogDAO(CatalogDAO catalogDAO) {
		this.catalogDAO = catalogDAO;
	}
	
}

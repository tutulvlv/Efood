package org.efood.service;

import java.util.List;

import org.efood.vo.Catalog;

public interface CatalogService {
	public List<Catalog> getCataLogList();
	public void saveCatalog(Catalog catalog);
	public void updateCatalog(Catalog catalog);
	public void deleteCatalog(Integer catalogid);
}

package org.efood.dao;

import java.util.List;

import org.efood.vo.Catalog;

public interface CatalogDAO {
	public List<Catalog> getCatalogList();
	public void saveCatalog(Catalog catalog);
	public void updateCatalog(Catalog catalog);
	public void deleteCatalog(Integer catalogid);
}

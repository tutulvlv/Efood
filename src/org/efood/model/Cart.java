package org.efood.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.efood.vo.Menu;
import org.efood.vo.Orderitem;

public class Cart {
	private Map<Integer,Orderitem> items;
	private double totalPrice;
	public Cart(){
		if(items==null)
			items=new HashMap<Integer,Orderitem>();
	}
	public void addMenu(Integer menuid,Orderitem orderitem){

		if(items.containsKey("menuid")){
			Orderitem _orderitem=items.get(menuid);
			orderitem.setQuantity(_orderitem.getQuantity()+orderitem.getQuantity());
			items.put(menuid,orderitem);
		}
		else{
			items.put(menuid,orderitem);
		}
	}

	public void updateCart(Integer menuid,int method){
		Orderitem orderitem = null;
		switch(method){
			case 0:
				items.remove(menuid);
				break;
			case 1:
				orderitem=items.get(menuid);
				orderitem.setQuantity(orderitem.getQuantity()-1);
				break;
			case 2:
				orderitem=items.get(menuid);
				orderitem.setQuantity(orderitem.getQuantity()+1);
				break;
		}
	}

	public void setTotalPrice(){
		int totalPrice=0;
		for(Iterator it=items.values().iterator();it.hasNext();){
			Orderitem orderitem=(Orderitem)it.next();
			Menu menu=orderitem.getMenu();
			int quantity=orderitem.getQuantity();
			totalPrice+=menu.getPrice()*quantity;
		}
		this.totalPrice=totalPrice;
	}
	public double getTotalPrice(){
		return totalPrice;
	}
	public Map<Integer, Orderitem> getItems() {
		return items;
	}
	public void setItems(Map<Integer, Orderitem> items) {
		this.items=items;
	}
}

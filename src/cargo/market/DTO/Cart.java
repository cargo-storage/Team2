package cargo.market.DTO;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartDTO> itemList = new ArrayList<CartDTO>();
	
	public List<CartDTO> getItemList(){
		return itemList;
	}
	
	public void push(CartDTO cdto){
		
		boolean check = false;
		
		for(CartDTO dto: itemList){
			if(cdto.getItem().equals(dto.getItem())){
				cdto.setQuantity(cdto.getQuantity()+dto.getQuantity());
				check = true;
				break;
			}
		}
		
		if(check==false){
			itemList.add(cdto);
		}
	}
	
}

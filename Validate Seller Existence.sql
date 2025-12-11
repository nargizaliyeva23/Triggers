#Validate Seller Existence Before Inserting an Order 

delimiter $$
create trigger trg_check_seller_exists
before insert on olist_order_items_dataset
for each row
begin 
	declare seller_exists int;
    
    select count(*)
    into seller_exists
    from olist_order_items_dataset
    where seller_id=new.seller_id;
    
    if seller_exists=0 then
    signal sqlstate '45000'
    set message_text='Seller does not exist in seller table!';
    end if;
end $$

delimiter ;


    
    
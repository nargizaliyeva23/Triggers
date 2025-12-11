# Restricting Sellers Based on Their City


delimiter $$

create trigger trg_restrict_seller_region
before insert on olist_order_items_dataset
for each row
begin 
	declare seller_state_code varchar(5);
    
    select seller_state 
    into seller_state_code
    from olist_sellers_dataset 
    where seller_id=new.seller_id;
    
    if seller_state_code<>'SP' then
    signal sqlstate '45000'
    set message_text='Orders only allowed from SP region sellers';
    end if;
end $$
delimiter ;






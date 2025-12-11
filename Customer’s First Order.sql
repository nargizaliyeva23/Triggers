# Customer’s First Order

alter table olist_customers_dataset_ready
add column first_order_date  datetime null;

delimiter $$
create trigger trg_first_order
after insert on olist_orders_dataset
for each row 
begin
	update olist_customers_dataset_ready
    set first_order_date=ifnull(first_order_date,now())
    where customer_id=new.customer_id;
end $$
delimiter ;

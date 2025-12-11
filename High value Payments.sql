# Log high-value payments

create table if not exists high_value_payments_log (
	log_id int auto_increment primary key,
    order_id varchar(255),
    payment_value decimal(10,2),
    logget_at datetime default current_timestamp
    );
    
    
delimiter $$
create trigger trg_high_value_payments 
after insert on olist_order_payments_dataset
for each row
begin 
	if new.payment_value>1000 then
		insert into high_value_payments_log (order_id,payment_value)
		values ( new.order_id,new.payment_value);
    end if;
end $$
delimiter ;



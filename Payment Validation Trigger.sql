# Payment Validation Trigger
select * from olist_order_payments_dataset;

delimiter $$
create trigger trg_validate_payment
before insert on olist_order_payments_dataset
for each row
begin 
	if new.payment_value<0 then
    signal sqlstate '45000'
    set message_text='Payment value cannot be negative';
    end if;
end $$
delimiter ;

insert into olist_order_payments_dataset
values ('b92ef226f3fe1789b1e8b2acac839d17', '1', 'credit_card', '8', '-50');





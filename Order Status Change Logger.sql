#Order Status Change Logger
create table order_status_log (
 id int auto_increment primary key,
 order_id  varchar(50),
 old_status varchar(50),
 new_status varchar(50),
 change_at timestamp default current_timestamp
 );

-- ----------------------------------------------------
delimiter $$

 create trigger trg_order_status_change 
 before update on olist_orders_dataset
 for each row 
 begin 
		if old.order_status <> new.order_status then
        insert into order_status_log(order_id, old_status, new_status)
        values (old.order_id, old.order_status , new.order_status);
        end if;
end $$
delimiter ;


update olist_orders_dataset
set order_status='shipped'
where order_id='e481f51cbdc54678b7cc49136f2d6af7';

select * from order_status_log;


# Sync with Category Name Translation
select * from olist_products_dataset;
select * from product_category_name_translation;

delimiter $$

create trigger trg_sync_category_translation
after update on product_category_name_translation
for each row
begin
	update olist_products_dataset
    set product_category_name=new.ï»¿product_category_name
    where product_category_name= old.ï»¿product_category_name;
end $$

delimiter ;
    
update product_category_name_translation
set ï»¿product_category_name='perfum'
where ï»¿product_category_name='perfumaria';

select * from olist_products_dataset
where product_category_name='perfum' ;

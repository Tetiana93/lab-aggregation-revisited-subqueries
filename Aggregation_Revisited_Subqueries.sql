select first_name, last_name, email from customer;
select c.customer_id, concat(c.first_name," ", c.last_name) as customer_name, avg(p.amount) as avg_amount from customer c
join payment p
on c.customer_id=p.customer_id
group by c.customer_id;
select distinct concat(cs.first_name, " ", cs.last_name) as customer_name, cs.email from customer cs
join rental using(customer_id)
join inventory using(inventory_id)
join film_category using(film_id)
join category c using(category_id)
where c.name ='Action'
order by customer_name;
select distinct concat(cs.first_name, " ", cs.last_name) as customer_name, cs.email from customer cs
where customer_id in (select customer_id from rental
join inventory using(inventory_id)
join film_category using(film_id)
join category c using(category_id)
where c.name ='Action')
order by customer_name;
select *,
case when amount between 0 and 2 then 'low'
when  amount between 2 and 4 then 'medium'
else 'high'
end as high_value_transactions
 from payment;


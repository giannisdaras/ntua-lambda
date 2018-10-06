use ntua_db;

delimiter |
create trigger check_norooms1 after insert on hotel_room
	for each row
	begin
	 update hotel set number_of_rooms = number_of_rooms+1 where hotel_id=new.hotel_id;
	end;
|

create trigger check_norooms2 after delete on hotel_room
	for each row
	begin
	 update hotel set number_of_rooms = number_of_rooms-1 where hotel_id=old.hotel_id;
	end;
|

create trigger check_nohotels1 after insert on hotel
	for each row
	begin
	 update hotel_group set number_of_hotels = number_of_hotels+1 where hotel_group_id=new.hotel_group_id;
	end;
|

create trigger check_nohotels2 after delete on hotel
	for each row
	begin
	 update hotel_group set number_of_hotels = number_of_hotels-1 where hotel_group_id=old.hotel_group_id;
	end;
|

create trigger check_updateroom after update on hotel_room
	for each row
	begin
		if (new.hotel_id <> old.hotel_id) then
		 update hotel set number_of_rooms=number_of_rooms+1 where hotel_id=new.hotel_id;
		 update hotel set number_of_rooms=number_of_rooms-1 where hotel_id=old.hotel_id;
		end if;
	end;

|

create trigger check_updatehotel after update on hotel
	for each row
	begin
		if (new.hotel_group_id <> old.hotel_group_id) then
		
	 	 update hotel_group set number_of_hotels=number_of_hotels+1 where hotel_group_id=new.hotel_group_id;
	 	 update hotel_group set number_of_hotels=number_of_hotels-1 where hotel_group_id=old.hotel_group_id;
	 	
	 	end if;
	end;
|

create trigger check_payment after insert on rents
	for each row
	begin
		update reserves set paid=1 where (irs=new.irs_customer and room_id=new.room_id and start_date=new.start_date and finish_date=new.finish_date);
	end;
|

create trigger check_reservation before insert on reserves
	for each row
	begin
		if (exists(select * from reserves where new.room_id=room_id and not(new.finish_date<=start_date or new.start_date>=finish_date))) then
		 signal sqlstate '45000' set message_text = 'Sorry,another user booked the room';
		end if;
	end;

|

create trigger check_for_hotel_group_email_validity1 before insert on hotel_group_emails
	for each row
	begin
		if (new.email not like '%@%.%' or new.email like '@%' or new.email like '%@%@%' ) then
			signal sqlstate '45000' set message_text = 'Wrong email';
		end if;
	end;
|

create trigger check_for_hotel_group_email_validity2 before update on hotel_group_emails
	for each row
	begin
		if (new.email not like '%@%.%' or new.email like '@%' or new.email like '%@%@%' ) then
			signal sqlstate '45000' set message_text = 'Wrong email';
		end if;
	end;
|


create trigger check_for_hotel_email_validity1 before insert on hotel_emails
	for each row
	begin
		if (new.email not like '%@%.%' or new.email like '@%' or new.email like '%@%@%' ) then
			signal sqlstate '45000' set message_text = 'Wrong email';
		end if;
	end;
|

create trigger check_for_hotel_email_validity2 before update on hotel_emails
	for each row
	begin
		if (new.email not like '%@%.%' or new.email like '@%' or new.email like '%@%@%' ) then
			signal sqlstate '45000' set message_text = 'Wrong email';
		end if;
	end;
|

create trigger check_for_hotel_group_phone_validity1 before insert on hotel_group_phones
	for each row
	begin
		if (new.phone<10000000 or new.phone>999999999999) then
			signal sqlstate '45000' set message_text = 'Wrong phone';
		end if;
	end;
|

create trigger check_for_hotel_group_phone_validity2 before update on hotel_group_phones
	for each row
	begin
		if (new.phone<10000000 or new.phone>999999999999) then
			signal sqlstate '45000' set message_text = 'Wrong phone';
		end if;
	end;
|

create trigger check_for_hotel_phone_validity1 before insert on hotel_phones
	for each row
	begin
		if (new.phone<10000000 or new.phone>999999999999) then
			signal sqlstate '45000' set message_text = 'Wrong phone';
		end if;
	end;
|

create trigger check_for_hotel_phone_validity2 before update on hotel_phones
	for each row
	begin
		if (new.phone<10000000 or new.phone>999999999999) then
			signal sqlstate '45000' set message_text = 'Wrong phone';
		end if;
	end;
|


create trigger check_for_stars_validity1 before insert on hotel
	for each row
	begin
		if (new.stars<=0 or new.stars>5) then
			signal sqlstate '45000' set message_text = 'Wrong star argument';
		end if;

	end;
|

create trigger check_for_stars_validity2 before update on hotel
	for each row
	begin
		if(new.stars<=0 or new.stars>5) then
			signal sqlstate '45000' set message_text = 'Wrong star argument';
		end if;
	end;
|
			 

create trigger check_for_hotel_room_validity1 before insert on hotel_room
	for each row
	begin
		if (new.view<0 or new.view>1 or new.capacity>4 or new.capacity<0 or new.expandable<0 or new.expandable>1 or new.price<0) then
			signal sqlstate '45000' set message_text = 'Wrong hotel room arguments';
		end if;
	end;
|

create trigger check_for_hotel_room_validity2 before update on hotel_room
	for each row
	begin
		if (new.view<0 or new.view>1 or new.capacity>4 or new.capacity<0 or new.expandable<0 or new.expandable>1 or new.price<0) then
			signal sqlstate '45000' set message_text = 'Wrong hotel room arguments';
		end if;
	end;
|

create trigger check_for_reserves_validity1 before insert on reserves
	for each row
	begin
		if (new.paid<0 or new.paid>1 or new.finish_date<=new.start_date) then 
			signal sqlstate '45000' set message_text = 'Wrong reservation';
		end if;
	end;
|


create trigger check_for_reserves_validity2 before update on reserves
	for each row
	begin
		if (new.paid<0 or new.paid>1 or new.finish_date<=new.start_date) then 
			signal sqlstate '45000' set message_text = 'Wrong reservation';
		end if;
	end;
|


create trigger check_for_rent_validity1 before insert on rents
	for each row
	begin
		if (new.payment_amount<0 or new.finish_date <= new.start_date ) then 
			signal sqlstate '45000' set message_text = 'Error in rents arguments';
		end if;
	end;	
|


create trigger check_for_rent_validity2 before update on rents
	for each row
	begin
		if (new.payment_amount<0 or new.finish_date <= new.start_date ) then 
			signal sqlstate '45000' set message_text = 'Error in rents arguments';
		end if;
	end;	
|


create trigger check_for_works_validity1 before insert on works
	for each row
	begin
		if (new.finish_date<new.start_date) then
			signal sqlstate '45000' set message_text = 'Work dates error';
		end if;
	end;
|


create trigger check_for_works_validity2 before update on works
	for each row
	begin
		if (new.finish_date<new.start_date) then
			signal sqlstate '45000' set message_text = 'Work dates error';
		end if;
	end;
|


	
create trigger check_for_manager_on_update before update on works
	for each row 
	begin
		if (new.position <> old.position and old.position='manager') then 
			if ( not exists(select * from works where new.hotel_id=hotel_id and new.position='manager'and new.finish_date>curdate())) then 
				signal sqlstate '45000' set message_text = 'Every hotel must have a manager';
			end if;
		end if;
	end;
|


create trigger check_for_manager_on_delete before delete on works
	for each row 
	begin
		if (old.position='manager') then
			if ( (select count(position) from works where old.position='manager' and old.finish_date>curdate())>1) then 
				signal sqlstate '45000' set message_text = 'Every hotel must have a manager';
			end if;
		end if;
	end;
|

create trigger create_workhistory_entry1 after insert on works
	for each row
	begin
		insert into works_history(irs_employee,hotel_id,hotel_group_id,position,start_date,finish_date) values (new.irs,new.hotel_id,(select hotel_group_id from hotel where hotel_id=new.hotel_id),new.position,new.start_date,new.finish_date);
        end;
|

create trigger create_workhistory_entry2 after update on works
	for each row
	begin
		insert into works_history(irs_employee,hotel_id,hotel_group_id,position,start_date,finish_date) values (new.irs,new.hotel_id,(select hotel_group_id from hotel where hotel_id=new.hotel_id),new.position,new.start_date,new.finish_date);
        end;
|

create trigger create_bookinghistory_entry1 after insert on rents
	for each row
	begin
		insert into booking_history(irs_employee,irs_customer,room_id,hotel_id,hotel_group_id,start_date,finish_date,payment_method) values (new.irs_employee,new.irs_customer,new.room_id,new.hotel_id,(select hotel_group_id from hotel where hotel_id=new.hotel_id),new.start_date,new.finish_date,new.payment_method);
	end;
|

create trigger create_bookinghistory_entry2 after update on rents
	for each row
	begin
		update booking_history set irs_employee=new.irs_employee,irs_customer=new.irs_customer,room_id=new.room_id,start_date=new.start_date,finish_date=new.finish_date,payment_method=new.payment_method,hotel_id=new.hotel_id,hotel_group_id=(select hotel_group_id from hotel where hotel_id=new.hotel_id);
	end;
|
delimiter ;


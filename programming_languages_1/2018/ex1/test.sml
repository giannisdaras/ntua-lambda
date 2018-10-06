fun doomsday infile = 
	let 
		fun get_first_tuple (x,y,z) = x;
		fun get_second_tuple (x,y,z) = y;
		fun get_third_tuple (x,y,z) = z;
		fun get_first_pair (x,y) = x;
		fun get_second_pair (x,y) = y;
		fun grid_initialization () = 
			let 
				fun strip a_string=
					let 
						val string_size=String.size(a_string);
					in 
						String.substring(a_string,0,string_size-1)
					end;
				fun get_padding 0 = nil 
				| get_padding (k):char list = String.sub("X",0) :: get_padding(k-1);
				fun readlist (infile : string) = 
					let 
					  val ins = TextIO.openIn infile 
					  fun loop ins = 
					  case TextIO.inputLine ins of 
					    SOME line => String.explode("X" ^ ( strip line ) ^ "X") :: loop ins 
				    	| NONE      => [] 
					in 
				  		loop ins before TextIO.closeIn ins 
					end ;
					val list_of_lists=readlist(infile);
					val N=length list_of_lists;
					val M= length (hd list_of_lists)-2;
					val padding=get_padding(M+2);
					val new_list= ( padding :: list_of_lists )@ [padding];
			in 
				(Array2.fromList(new_list) , N, M)
			end;
		val tuple=grid_initialization ();
		val grid= #1 tuple;
		val N= #2 tuple;
		val M= #3 tuple;



		(* TODO: fix complexity using ref *)
		fun initialize_queue () =
			let
				val my_queue= nil;
				fun helper (i,j,my_queue) = 
					if (i<=N) then
						if (j<=M) then 
							if (Array2.sub(grid,i,j)=String.sub("+",0)) then helper(i,j+1,(i,j,Array2.sub(grid,i,j) ) :: my_queue)
							else if ( Array2.sub(grid,i,j)=String.sub("-",0) ) then helper(i,j+1,(i,j,Array2.sub(grid,i,j) ) :: my_queue)
							else helper(i,j+1,my_queue)
						else helper(i+1,1,my_queue)
					else
						my_queue;
			in 
				helper(1,1,my_queue)
			end;
		val last_updated = ref ( initialize_queue () );



			
		fun my_big_while (last_updated: (int * int * char) list ref, counter:int ref, ref true, flag_queue) = ()
		| my_big_while (last_updated, counter: int ref, flag_end, ref false ) = ()
		| my_big_while (last_updated, counter: int ref, flag_end, flag_queue ) = 
			let 
				val last_updated_new = ref nil;
				val to_update = ref nil;
				fun update_my_grid nil = ()
				| update_my_grid to_update =
					let 
						val tmp = hd to_update;
					in	
						Array2.update(grid, get_first_pair tmp ,get_second_pair tmp , #"*");
						update_my_grid (tl to_update)
					end;
				fun get_neighbors (i,j) =
					let 
						fun get_if_not_x (i,j)=
							let 
								val x=Array2.sub(grid,i,j)
							in
								if (x=String.sub("X",0)) then nil
								else (i,j) :: nil
							end;
					in 
						get_if_not_x(i-1,j) @ get_if_not_x(i+1,j) @ get_if_not_x(i,j-1) @ get_if_not_x(i,j+1)
					end;
				
				fun helper nil = () 
				| helper last_updated =
					let 
						val current_i = get_first_tuple (hd last_updated);
						val current_j = get_second_tuple (hd last_updated);
						val current_symbol = get_third_tuple (hd last_updated);
						fun run_on_neighbors (symbol, nil) = ()
						| run_on_neighbors (symbol,neighbors) = 
							let
								val neighbor_i = get_first_pair (hd neighbors);
								val neighbor_j = get_second_pair (hd neighbors);
								val neighbor_symbol = Array2.sub(grid,neighbor_i,neighbor_j);
							in 
								if (neighbor_symbol= #".") then (
									last_updated_new := (neighbor_i,neighbor_j,symbol) :: !last_updated_new;
									flag_queue := true;
									Array2.update(grid,neighbor_i,neighbor_j,current_symbol)
								)
								else if (neighbor_symbol<>current_symbol) then (
									flag_end := true;
									to_update := (neighbor_i,neighbor_j) :: !to_update;
									()
								)
								else ();
								run_on_neighbors(symbol,tl neighbors)
							end;
						val neighbors = get_neighbors (current_i,current_j)
					in 
						run_on_neighbors(current_symbol, neighbors );
						helper (tl last_updated)
					end;		
			in 
				counter := ! counter +1;
				flag_queue := false;
				helper (!last_updated);
				update_my_grid(!to_update);
				my_big_while(last_updated_new,counter,flag_end,flag_queue)
			end;


		fun print_grid () =
			let
				fun helper (i,j) = 
					if (i<=N) then
						if (j<=M) then (
							print(Char.toString(Array2.sub(grid,i,j)) ^ " ");
							helper(i,j+1)
						)
						else (
							print("\n"); 
							helper(i+1,1)
						) 
					else
						();
			in 
				helper(1,1)
			end;

		val counter= ref 0;
		val flag_end= ref false;
		val flag_queue= ref true;
	in 
		my_big_while (last_updated,counter, flag_end, flag_queue);
		if (!flag_end= true) then (
			print (Int.toString(!counter) ^ "\n")
		)
		else print ("the world is saved\n");
		print_grid ()
	end;





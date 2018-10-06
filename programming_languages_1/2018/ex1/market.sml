fun agora infile = 
	let
		fun int_from_stream stream =
		  	case (TextIO.scanStream (Int.scan StringCvt.DEC) stream) of 
		  		NONE => ~1
		  		| a => Option.valOf(a); 

		fun read_integers (fstream) = 
			let 
				val a = int_from_stream fstream
			in
				if (a=(~1))	then nil
				else a :: read_integers (fstream)
			end;

		fun lcm (x:IntInf.int, y:IntInf.int):IntInf.int =
			let 
				val (a,b):IntInf.int * IntInf.int=(x,y)
				fun lcm_help ((k,l)):IntInf.int =
					if (l>0) then lcm_help (l, k mod l)
					else k;
			in
				 (a  div lcm_help(x,y) ) * b 
			end;

		fun calculate_left (list_a:int list):IntInf.int list=
			let 
				fun helper (previous,nil, list_c) = rev list_c |
				helper (previous:IntInf.int,list_b: int list, list_c):IntInf.int list = 
					let 
						val a=lcm(previous, Int.toLarge(hd list_b) );
					in 
						helper (a,tl list_b, a :: list_c)
					end;
			in
				helper (1,list_a,nil)
			end;

		fun calculate_right (list_a:int list):IntInf.int list=
			let 
				fun helper (previous,nil, list_c) = list_c |
				helper (previous:IntInf.int,list_b: int list,list_c):IntInf.int list = 
					let 
						val a=lcm(previous, Int.toLarge(hd list_b) );
					in 
						helper (a,tl list_b, a :: list_c)
					end;
			in
				helper (1,rev list_a,nil)
			end;

		fun lcms_without (left_lcms: IntInf.int list, nil, list_c): IntInf.int list = rev list_c
			| lcms_without (nil, right_lcms: IntInf.int list,list_c): IntInf.int list = rev list_c
			| lcms_without (left_lcms:IntInf.int list,right_lcms:IntInf.int list,list_c) =
			lcms_without (tl left_lcms,tl right_lcms, lcm (hd left_lcms,hd right_lcms ) :: list_c);

		fun find_min (list_a: IntInf.int list) : (IntInf.int * int) = 
			let 
				val minim = hd list_a
				fun helper ([], minim,help_index,index) = (minim,index)
				| helper (list_a,minim,help_index,index) =
					if ( (hd list_a) < minim ) then helper (tl list_a, hd list_a,help_index+1,help_index)
					else helper (tl list_a, minim,help_index+1,index)
			in 
				helper (list_a,minim,1,1)
			end; 

		val fstream = TextIO.openIn infile;
		val inp=read_integers (fstream);
		val N=hd inp;
		val my_list=tl inp;
		val left_lcms=calculate_left my_list;
		val right_lcms=calculate_right my_list;
		val all_lcm=hd right_lcms;
		val lcms_list = lcms_without (1 :: left_lcms, (tl right_lcms) @ [1],nil);
		val (minim,index)= find_min (lcms_list);
	in
		if (minim=all_lcm) then print (LargeInt.toString(minim) ^ " " ^ Int.toString(0) ^ "\n")
		else print (LargeInt.toString(minim) ^ " " ^ Int.toString(index) ^ "\n")
	end;









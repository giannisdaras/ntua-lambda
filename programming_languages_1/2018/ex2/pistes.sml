fun pistes infile=
	let 
		fun qsort(func) =
			let
			    fun
			        sort([]) = [] |
			        sort(lhd :: ltl) = sort(List.filter(fn (x) => func(x, lhd))(ltl)) @ [lhd] @ sort(List.filter(fn (x) => not(func(x, lhd)))(ltl))
			in sort
			end;
		fun f (x,y) = if (x<y) then true else false
		val ht : (string, int) HashTable.hash_table = HashTable.mkTable(HashString.hashString, op=)(17, Domain)
		
		type Player={id: int, totalStars: int, keysNeeded: int list, keysGives: int list};	
		type Path={myIds: int list,availablePlayers: Player list, availableKeys: int list,totalStars:int};
		
		(*returns -1 and empty list if it's not accessible *)
		(* otherwise, it returns 1 and the new keys *)
		fun checkIfAccessible (myKeys: int list,keysNeeded: int list,keysGives: int list) =
			let
				fun checkIfExists (nil,pos,x) = ~1
					| checkIfExists (ls,pos,x) =
						if (hd ls = x) then pos
						else checkIfExists(tl ls, pos+1, x)

				fun removeElement (myLs,index)=
					let
						fun help_remove (nil, currIndex,index)=nil
							| help_remove (myLs,currIndex,index)=
								if (currIndex=index) then help_remove(tl myLs,currIndex+1,index)
								else (hd myLs) :: help_remove(tl myLs, currIndex+1,index)
					in
						help_remove(myLs,0,index)
					end

				fun repeat (nil, nil) = (1,nil)
					| repeat(nil,keysNeeded)=(~1,nil)
					| repeat(myKeys, nil) = (1,myKeys)
					| repeat (myKeys: int list, keysNeeded:int list) =
						let 
							val indx= checkIfExists(myKeys,0,hd keysNeeded)
						in
							if ( not ( indx= (~1) ) ) then
								repeat(removeElement(myKeys,indx),tl keysNeeded)
							else (~1,nil)
						end;
				val out=repeat(myKeys,keysNeeded)
			in
				if ( # 1 out = (~1) ) then (~1,nil)
				else (1, #2 out @ keysGives)
			end

		(*creates a list o strings from ids*)
		fun getListOfStrings myIds =
			if (myIds=nil) then nil
			else Int.toString(hd myIds) :: getListOfStrings (tl myIds)
		
		(* sorts and concats ids *)
		fun fixKey myIds=
			let
				val sortedIds=qsort(f) myIds
			in 
				String.concat(getListOfStrings sortedIds)
			end

		fun myOr (x,y)=
			if (x=true) then true
			else 
				if (y=true) then true
				else false

		fun doAll myIds=
			let
				fun handleKey key =
					case (HashTable.find ht key) of
						NONE => ~1
						| a => 1;
			in 
				handleKey (fixKey myIds)
			end;


		(* helper function to remove player from list *)
		fun removePlayer (nil,id)= nil
			| removePlayer (playersList: Player list, id:int)=
				if ( (#id (hd playersList) )= id ) then removePlayer (tl playersList,id)
				else (hd playersList) :: removePlayer(tl playersList,id)

		fun getInstPaths (path_inst:Path):Path list=
			let 
				val playersLeftConstant= #availablePlayers path_inst
				val myIdsConst= #myIds path_inst
				fun updateHash (s,res2)=
					if (res2=(~1)) then  HashTable.insert ht (s,1)  
					else ()
				fun getNewPaths (nil,keysInPosition,starsInPosition)=nil
					| getNewPaths (playersLeftRunning: Player list,keysInPosition: int list,starsInPosition: int): Path list=
					let
						val curr = hd playersLeftRunning
						val res= checkIfAccessible(keysInPosition,#keysNeeded curr,#keysGives curr)
						val newIds=(#id curr) :: myIdsConst
						val y:Path={myIds=newIds,availablePlayers= removePlayer(playersLeftConstant, #id curr),availableKeys=(#2) res,totalStars=(starsInPosition+ #totalStars curr)}
						val res1=(#1) res
						val res2=doAll(newIds)
						val s=fixKey(newIds)
					in 	
						(*already in hashtable or not accessible*)
						updateHash (s,1);
						if ( myOr (res1=(~1),res2=1) ) then getNewPaths (tl playersLeftRunning,keysInPosition,starsInPosition)
						else 
							y :: getNewPaths (tl playersLeftRunning,keysInPosition,starsInPosition)
					end
			in 
				getNewPaths(#availablePlayers path_inst,#availableKeys path_inst,#totalStars path_inst)
			end;


		fun int_from_stream stream =
		  	case (TextIO.scanStream (Int.scan StringCvt.DEC) stream) of 
		  		NONE => ~1
		  		| a => Option.valOf(a); 

		fun read_input fstream=
			let 
				fun readKeysNeeded (x,fstream)=
					if (x>0) then int_from_stream fstream :: readKeysNeeded (x-1,fstream)
					else nil

				fun readKeysGives (x,fstream)=
					if (x>0) then int_from_stream fstream :: readKeysGives (x-1,fstream)
					else nil
				
				fun read_more (fstream,counter,a)=
					let 
						val b= int_from_stream fstream
						val c= int_from_stream fstream
						val y: Player={id=counter, totalStars= c, keysNeeded=readKeysNeeded (a,fstream),keysGives=readKeysGives (b,fstream)}
					in 
						y
					end;
				fun read_line counter =
					let 
						val a = int_from_stream fstream
					in 
						if (a=(~1)) then nil
						else
							read_more (fstream,counter,a) :: read_line (counter+1)
					end;
			in 
				read_line 0
		end;



		fun run (myQueue,maxim)=
			if (myQueue=nil) then maxim
			else 
				if (#totalStars (hd myQueue) > maxim) then run(tl myQueue @ getInstPaths (hd myQueue),#totalStars (hd myQueue))
				else run(tl myQueue @ getInstPaths (hd myQueue),maxim)

		fun getOpen (nil, freeKeys,freeStars,initialIds)=(freeKeys,freeStars,initialIds)
			| getOpen (inp: Player list,freeKeys,freeStars,initialIds) =
				let
					val currPlayer= hd inp
					val id= #id currPlayer
					val keysNeeded= #keysNeeded currPlayer
					val keysGives= #keysGives currPlayer
					val starsGives= #totalStars currPlayer
				in
					if (keysNeeded=nil) then getOpen(tl inp, freeKeys@keysGives,freeStars+starsGives,id :: initialIds)
					else getOpen(tl inp, freeKeys,freeStars, initialIds)
				end

		fun removeOpen(inp: Player list) =
			if (inp=nil) then nil
			else 
				if (#keysNeeded (hd inp) = nil) then removeOpen(tl inp)
				else (hd inp) :: removeOpen (tl inp)
			

		val fstream = TextIO.openIn infile
		val l=int_from_stream(fstream)
		val tmp=read_input(fstream)
		val (avKeys, freeStars, avIds)=getOpen(tmp,nil,0,nil)
		val avPlayers= removeOpen(tmp)
		val pathObj:Path={myIds=avIds,availablePlayers=avPlayers, availableKeys=avKeys,totalStars=freeStars}
		val myQueue=[pathObj]
	in
		print (Int.toString(run(myQueue,freeStars)))
	end;



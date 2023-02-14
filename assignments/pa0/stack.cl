
class List {

    
    isNil() : Bool { true };

    head()  : String { { abort(); "0"; } };

 
    tail()  : List { { abort(); self; } };
 

    cons(i : String) : List {
       (new Cons).init(i, self)
    };
 
 };
 

 class Cons inherits List {
 
    car : String;	-- The element in this list cell
 
    cdr : List;	-- The rest of the list
 
    isNil() : Bool { false };
 
    head()  : String { car };
 
    tail()  : List { cdr };

    init(i : String, rest : List) : List {
       {
      car <- i;
      cdr <- rest;
      self;
       }
    };
 
 };
 
 
 


 class Main inherits IO{


    mylist: List;
    value :String;
    valuetype: Int;

    added: Int;
    swapped1:String;
    swapped2:String;

    ans:Bool;

    x: Bool;
    lastchar :String;
    newlist : List;
    lastchar2 :String;
    newlist2 :List;
    lastchar3: String;
    newlist3:List;

    c2i(char : String) : Int {
        if char = "0" then 0 else
        if char = "1" then 1 else
        if char = "2" then 2 else
            if char = "3" then 3 else
            if char = "4" then 4 else
            if char = "5" then 5 else
            if char = "6" then 6 else
            if char = "7" then 7 else
            if char = "8" then 8 else
            if char = "9" then 9 else
            { abort(); 0; }  -- the 0 is needed to satisfy the typchecker
            fi fi fi fi fi fi fi fi fi fi
         };

         i2c(i : Int) : String {
        if i = 0 then "0" else
        if i = 1 then "1" else
        if i = 2 then "2" else
        if i = 3 then "3" else
        if i = 4 then "4" else
        if i = 5 then "5" else
        if i = 6 then "6" else
        if i = 7 then "7" else
        if i = 8 then "8" else
        if i = 9 then "9" else
        { abort(); ""; }  -- the "" is needed to satisfy the typchecker
            fi fi fi fi fi fi fi fi fi fi
         };
     
         a2i(s : String) : Int {
            if s.length() = 0 then 0 else
        if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
            if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
               a2i_aux(s)
            fi fi fi
         };
   
         a2i_aux(s : String) : Int {
        (let int : Int <- 0 in
               {
                   (let j : Int <- s.length() in
                  (let i : Int <- 0 in
                while i < j loop
                {
                    int <- int * 10 + c2i(s.substr(i,1));
                    i <- i + 1;
                }
                pool
              )
               );
                  int;
            }
            )
         };
     
   
        i2a(i : Int) : String {
        if i = 0 then "0" else
            if 0 < i then i2a_aux(i) else
              "-".concat(i2a_aux(i * ~1))
            fi fi
        };
     
 
        i2a_aux(i : Int) : String {
            if i = 0 then "" else
            (let next : Int <- i / 10 in
            i2a_aux(next).concat(i2c(i - next * 10))
            )
            fi
        };



    print_list(l : List) : Object {
        if l.isNil() then 
        out_string("")
        
                     else {
                 out_string(l.head());
                 out_string(" ");
                 out_string("\n");

                 print_list(l.tail());
                  }
        fi
     };
    

    prompt(mylist:List) : List {     
        
        {
        while (not( value = "x")) loop
        {

        out_string(">");
        value <- in_string();

        mylist <- decide(value, mylist);
        }
        pool;

        mylist;

    }
    };

    decide(value:String, mylist:List): List{
        
        if value = "d" then{

            print_list(mylist);

            mylist;
            }
        else if value = "e" then {

         
            mylist <- evaluatedecide(mylist);

            mylist;


        }       
        else {

            mylist <- mylist.cons(value);


            mylist;
        }
        

        fi
        
        fi
    

    };


    evaluatedecide(mylist:List): List{
{
        x <- evaluatable(mylist);

        mylist <- evaluatedecide2(mylist,x);

        mylist;

}

    };

    evaluatedecide2(mylist:List, x:Bool): List{



        if x = true then{


            mylist <- evaluate(mylist);
            mylist;

        }
        else{

            mylist;

        }

        
        
        fi

    };


    evaluatable(mylist:List): Bool{

        if (Not(mylist.isNil())) then{
            newlist <- mylist.tail();

            x <- evaluatable2(newlist);

            ans <- evaluatable22(x);

            ans;
        }
        else{

            false;
        }
        fi

    };

    evaluatable22(x:Bool):Bool{


        if x=true then{

            true;

        }
        else{

                        -- out_string("evaluatable22fail||");

            false;

        }
        fi


    };


    evaluatable2(mylist:List): Bool{

        if (Not(mylist.isNil())) then{
            newlist <- mylist.tail();
        -- out_string("3gone||");

            x <- evaluatable4(newlist);

            -- if x=true then{

            --     true;

            -- }
            -- else{
            --     false;
            -- }

            -- fi


            ans <- evaluatable22(x);

            ans;
        }
        else{
            -- out_string("evaluatable2fail||");


            false;
        }
        fi

    };

    evaluatable3(mylist:List): Bool{

        if (Not(mylist.isNil())) then{
            newlist <- mylist.tail();

            x <- evaluatable4(newlist);

            -- if x=true then{

            --     true;

            -- }
            -- else{
            --     false;
            -- }
            -- fi

            ans <- evaluatable22(x);
            -- out_string("322fail||");

            
            ans;
        }
        else{
            -- out_string("evaluatable3fail||");


            false;
        }
        fi

    };

    evaluatable4(mylist:List): Bool{

        if (Not(mylist.isNil())) then{
          true;
        }
        else{
            -- out_string("evaluatable4fail||");


            false;
        }
        fi

    };






    evaluate(mylist:List): List{
    {

         
        lastchar <- mylist.head();
        newlist <- mylist.tail();
        lastchar2 <- newlist.head();
        newlist2 <- newlist.tail();
        lastchar3 <- newlist2.head();
        newlist3 <- newlist2.tail();



        mylist <- check(mylist,lastchar,newlist,lastchar2,newlist2,lastchar3,newlist3);


        mylist;

    }


    };


    check(mylist:List, lastchar:String, newlist:List, lastchar2:String ,newlist2:List ,lastchar3:String, newlist3:List ): List{

 
        if lastchar = "+" then{

            added <- ( a2i(lastchar2) + a2i(lastchar3));

            newlist3 <- newlist3.cons(i2a(added));
            mylist <- newlist3;
         
            mylist;


            
            
        }
        else if lastchar = "s" then{

            swapped1 <- lastchar2;
            swapped2 <- lastchar3;
            
            newlist3 <- newlist3.cons(swapped1).cons(swapped2);
            mylist <- newlist3;

            mylist;
        }
        else{
            mylist;

        }

        fi
        fi
    
        
    };





    main(): Object{ { 
        

        mylist <- new List;


        -- mylist <- mylist.cons("1");
        -- mylist <- mylist.cons("2");
        -- mylist <- mylist.cons("6");
        -- mylist <- mylist.cons("+");
        -- mylist <- mylist.cons("7");
        -- mylist <- mylist.cons("1");
        -- mylist <- mylist.cons("+");
        -- mylist <- mylist.cons("6");
        -- mylist <- mylist.cons("8");
        -- mylist <- mylist.cons("+");
 


        mylist <- prompt(mylist);
        1;
    }   
    };
};

    





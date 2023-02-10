-- class Main inherits IO {

--    main() : Object {
--       out_string("Nothing implemented\n")
--    };

-- };


class Main inherits IO{


      prompt() : String {
            {
            in_string();
            }
      };






      addcommand() StackCommand {
            {

       


         if s <- "0" then

            out_string("DONE");


            self;

            }



      };

      

   
      main(){

            s : String <- prompt()
            addcommand(s);


      }




}


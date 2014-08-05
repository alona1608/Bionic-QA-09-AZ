function Main()
{   Test1()
    Test2()
  }
          
function Test1()
{  TestedApps.notepad.Run()     
         //variables description
  var  notepad;
  var  wndNotepad;
  var  edit;
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  edit = wndNotepad.Edit;
   //creation of the new text file
  edit.Keys("hello,you");
  wndNotepad.MainMenu.Click("File|Save");
  notepad.dlgSaveAs.SaveFile("C:\\Documents and Settings\\1234.txt", "Text Documents (*.txt)");
    
 aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "hello,you", false);   
     //closing and setting the parametrs
  wndNotepad.Close();
     TestedApps.notepad.Params.SimpleParams.CommandLineParameters = "C:\\Documents and Settings\\1234.txt" ; 
   Delay(5000) ;
   
 }  
   
   function Test2()   
   
{   // opening of the saved file
TestedApps.notepad.Params.SimpleParams.CommandLineParameters = "C:\\Documents and Settings\\1234.txt" ;
   TestedApps.notepad.Run() 
 //variables description  
  var  notepad;
  var  wndNotepad;
  var  edit;
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
    //edit of the saved text
  edit = Aliases.notepad.wndNotepad.Edit;
  edit.Click(100, 15);
  edit.Keys("[BS][BS][BS]world");
  wndNotepad.MainMenu.Click("File|Save"); 
  wndNotepad.Close(); 
        Delay(5000)   ;
   TestedApps.notepad.Run() 
  TestedApps.notepad.Params.SimpleParams.CommandLineParameters = "C:\\Documents and Settings\\1234.txt" ;
     //checking of the saved changes   
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "hello,world", false);
   wndNotepad.Close(); 
   //cleaning
   aqFile.Delete("C:\\Documents and Settings\\1234.txt")  
   TestedApps.notepad.Params.SimpleParams.CommandLineParameters = "";
   }
   
  
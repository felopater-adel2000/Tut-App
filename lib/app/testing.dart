class Log
{
  static void d(String d)
  {
    print("////////////////////{--Message--}//////////////////////-->> $d \n");
  }
  static void m(String m)
  {
    print("////////////////////{--Message--}//////////////////////-->> $m \n");
  }

  static void catchE(e)
  {
    print("////////////////////{--Catch Error--}//////////////////////-->> \n");
    print("////////////////////{--Error--}//////////////////////-->> ${e.toString()} \n");
  }

  static void e(String e)
  {
    print("////////////////////{--Error--}//////////////////////-->> $e \n");
  }

  static void w(String w)
  {
    print("////////////////////{--Warning--}//////////////////////-->> $w");
  }
  static void faildResponse(value, String type)
  {
    w("Faild response $type");
    w(value.statusCode.toString());
    w(value.data.toString());
  }
}


import junit.framework.TestCase;

public class TesteRomanos extends TestCase{
  
  public void test1RetornaI(){
    assertEquals("I", new NumerosRomanos().paraInteiro(1));
  }
  
  public void test2RetornaII(){
    assertEquals("II", new NumerosRomanos().paraInteiro(2));
  }
  
  public void test3RetornaIII(){
    assertEquals("III", new NumerosRomanos().paraInteiro(3));
  }
  
  public void test4RetornaIV(){
    assertEquals("IV", new NumerosRomanos().paraInteiro(4));
  }

  public void test5RetornaV(){
    assertEquals("V", new NumerosRomanos().paraInteiro(5));
  }
  
  public void test6RetornaVI(){
    assertEquals("VI", new NumerosRomanos().paraInteiro(6));
  } 
  
  public void test7RetornaVII(){
    assertEquals("VII", new NumerosRomanos().paraInteiro(7));
  } 
  
  public void test9RetornaIX(){
    assertEquals("IX", new NumerosRomanos().paraInteiro(9));
  } 
  
  public void test10RetornaX(){
    assertEquals("X", new NumerosRomanos().paraInteiro(10));
  } 
  
  public void test11RetornaXI(){
    assertEquals("XI", new NumerosRomanos().paraInteiro(11));
  } 
  
  public void test14RetornaXIV(){
    assertEquals("XIV", new NumerosRomanos().paraInteiro(14));
  } 
  
  public void test19RetornaXIX(){
    assertEquals("XIX", new NumerosRomanos().paraInteiro(19));
  } 

  public void test20RetornaXX(){
    assertEquals("XX", new NumerosRomanos().paraInteiro(20));
  }
  
  public void test28RetornaXXVIII(){
    assertEquals("XXVIII", new NumerosRomanos().paraInteiro(28));
  }
  
  public void test39RetornaXXXIX(){
    assertEquals("XXXIX", new NumerosRomanos().paraInteiro(39));
  }
  
  public void test40RetornaXL(){
    assertEquals("XL", new NumerosRomanos().paraInteiro(40));
  }
  
  public void test90RetornaXC(){
    assertEquals("XC", new NumerosRomanos().paraInteiro(90));
  }
  
  public void test99RetornaXCIX(){
    assertEquals("XCIX", new NumerosRomanos().paraInteiro(99));
  }
  
  public void test397RetornaCCCXCVII(){
    assertEquals("CCCXCVII", new NumerosRomanos().paraInteiro(397));
  }
  
  public void test1818RetornaMDCCCXVIII(){
    assertEquals("MDCCCXVIII", new NumerosRomanos().paraInteiro(1818));
  }
  
  public void test4000RetornaI_V_(){
    assertEquals("̅I̅V", new NumerosRomanos().paraInteiro(4000));
  }
  
  public void test4001RetornaI_V_I(){
    assertEquals("̅I̅VI", new NumerosRomanos().paraInteiro(4001));
  }
  
  public void test9001RetornaI_X_I(){
    assertEquals("̅I̅XI", new NumerosRomanos().paraInteiro(9001));
  }
  
  public void test20000RetornaX_X_(){
    assertEquals("̅X̅X", new NumerosRomanos().paraInteiro(20000));
  }
  
  public void test40000RetornaX_L_(){
    assertEquals("̅X̅L", new NumerosRomanos().paraInteiro(40000));
  }
  
  public void test50000RetornaL_(){
    assertEquals("̅L", new NumerosRomanos().paraInteiro(50000));
  }
  
  public void test90000RetornaX_C_(){
    assertEquals("̅X̅C", new NumerosRomanos().paraInteiro(90000));
  }
  
  public void test90001RetornaX_C_I(){
    assertEquals("̅X̅CI", new NumerosRomanos().paraInteiro(90001));
  }
  
  public void test100001RetornaC_I(){
    assertEquals("̅CI", new NumerosRomanos().paraInteiro(100001));
  }
  
  public void test400000RetornaC_D_(){
    assertEquals("̅C̅D", new NumerosRomanos().paraInteiro(400000));
  }
  
  public void test900000RetornaC_M_(){
    assertEquals("̅C̅M", new NumerosRomanos().paraInteiro(900000));
  }
  
  public void test1000000RetornaM_(){
    assertEquals("̅M", new NumerosRomanos().paraInteiro(1000000));
  }
  
  public void test3000000RetornaM_M_M_(){
    assertEquals("̅M̅M̅M", new NumerosRomanos().paraInteiro(3000000));
  }
  
  public void test3900000RetornaM_M_M_C_M_(){
    assertEquals("̅M̅M̅M̅C̅M", new NumerosRomanos().paraInteiro(3900000));
  }
  
  public void test3990000RetornaM_M_M_C_M_X_C_(){
    assertEquals("̅M̅M̅M̅C̅M̅X̅C", new NumerosRomanos().paraInteiro(3990000));
  }
  
  public void test3999000RetornaM_M_M_C_M_X_C_I_X_(){
    assertEquals("̅M̅M̅M̅C̅M̅X̅C̅I̅X", new NumerosRomanos().paraInteiro(3999000));
  }
  
  public void test3999900RetornaM_M_M_C_M_X_C_I_X_CM(){
    assertEquals("̅M̅M̅M̅C̅M̅X̅C̅I̅XCM", new NumerosRomanos().paraInteiro(3999900));
  }
  
  public void test3999990RetornaM_M_M_C_M_X_C_I_X_CMXC(){
    assertEquals("̅M̅M̅M̅C̅M̅X̅C̅I̅XCMXC", new NumerosRomanos().paraInteiro(3999990));
  }
  
  public void test3999999RetornaM_M_M_C_M_X_C_I_X_CMXCIX(){
    assertEquals("̅M̅M̅M̅C̅M̅X̅C̅I̅XCMXCIX", new NumerosRomanos().paraInteiro(3999999));
  }
  
  public void test4000000RetornaM_M_M_M_(){
    assertEquals("̅M̅M̅M̅M", new NumerosRomanos().paraInteiro(4000000));
  }
  
  public void test5000000RetornaM_M_M_M_M_(){
    assertEquals("̅M̅M̅M̅M̅M", new NumerosRomanos().paraInteiro(5000000));
  }
  
  public void test6000000RetornaM_M_M_M_M_M_(){
    assertEquals("̅M̅M̅M̅M̅M̅M", new NumerosRomanos().paraInteiro(6000000));
  }
  
  public void test9000000RetornaM_M_M_M_M_M_M_M_M_(){
    assertEquals("̅M̅M̅M̅M̅M̅M̅M̅M̅M", new NumerosRomanos().paraInteiro(9000000));
  }
  
  public void test10000000RetornaM_M_M_M_M_M_M_M_M_M_(){
    assertEquals("̅M̅M̅M̅M̅M̅M̅M̅M̅M̅M", new NumerosRomanos().paraInteiro(10000000));
  }
  

}
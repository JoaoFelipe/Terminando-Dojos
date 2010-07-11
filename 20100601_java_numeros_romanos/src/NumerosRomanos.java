import java.util.HashMap;


public class NumerosRomanos {
  
  private HashMap<Integer,String> hashMap;  
  
  public NumerosRomanos()
  {
    this.hashMap = new HashMap<Integer,String>();
    this.hashMap.put(1, "I");
    this.hashMap.put(5, "V");
    this.hashMap.put(10, "X");
    this.hashMap.put(50, "L");
    this.hashMap.put(100, "C");
    this.hashMap.put(500, "D");
    this.hashMap.put(1000, "M");
    this.hashMap.put(1001, "̅I");
    this.hashMap.put(5000, "̅V");
    this.hashMap.put(10000, "̅X");
    this.hashMap.put(50000, "̅L");
    this.hashMap.put(100000, "̅C");
    this.hashMap.put(500000, "̅D");
    this.hashMap.put(1000000, "̅M");
  }
  
  public String resolverNumeros(int numeros, int base){
    int resto = numeros % (5*base);
    if (resto == 4*base)
      if ((numeros == 4000) || (numeros == 9000))
        return this.hashMap.get(base+1) + this.hashMap.get(numeros+base);
      else return this.hashMap.get(base) + this.hashMap.get(numeros+base);
    String resultado = "";
    if (numeros >= 5*base)
      resultado = this.hashMap.get(5*base);
    for (int i = 0; i < resto/base ; i++){
      resultado += this.hashMap.get(base);
    }
    return resultado;
  }
  
  public String resolverMilhoes(int numeros){
    String resultado ="";
    for (int i = 0; i < numeros/1000000 ; i++)
      resultado += this.hashMap.get(1000000);
    return resultado;
  }
    
  public String paraInteiro(int numeroInteiro){

    String resultado = "";  
    int unidades = numeroInteiro % 10;
    int dezenas = (numeroInteiro - unidades) % 100;
    int centenas = (numeroInteiro - dezenas - unidades) % 1000;
    int milhares = (numeroInteiro - centenas - dezenas - unidades) % 10000;
    int dezenasDeMilhares = (numeroInteiro - milhares - centenas - dezenas - unidades) % 100000;
    int centenasDeMilhares = (numeroInteiro - dezenasDeMilhares - milhares - centenas - dezenas - unidades) % 1000000;
    int milhoes = (numeroInteiro -centenasDeMilhares - dezenasDeMilhares - milhares - centenas - dezenas - unidades);
      
      resultado +=resolverMilhoes(milhoes)+resolverNumeros(centenasDeMilhares,100000)+resolverNumeros(dezenasDeMilhares,10000)+resolverNumeros(milhares,1000)+resolverNumeros(centenas,100)+resolverNumeros(dezenas,10)+resolverNumeros(unidades,1);
      
    return resultado; 

  }
  
}
